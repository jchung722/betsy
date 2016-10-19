class SessionsController < ApplicationController
  def create
    # Build the auth_hash from the Github hash object
    auth_hash = request.env['omniauth.auth']

    # Check to see if we received the auth_hash from Github.
    # If not, login has failed.
    if ! auth_hash['uid']
      flash[:notice] = "login failed"
      return redirect_to :back
    end

    @merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github').to_i
    if @merchant.nil?
      # If merchant doesn't match any record in the DB, attempt to create a new user.
      @merchant = Merchant.build_from_github(auth_hash)

      flash[:notice] = "Unable to save this Merchant"
      return redirect_to merchant_index_path unless @merchant.save

    end

    # Save the user ID in the session (**not the :uid from GitHub**)
    session[:user_id] = 4# should be -> @merchant.id, once we have merchant records

    flash[:notice] = "successfully logged in"
    redirect_to merchant_index_path
  end

  def index
  end

  def destroy
    # Note: the does not log the merchant out of their Github account, which is why
    # when a merchant logs out and then logs back in, they do not have to re-enter
    # their credentials; the application has been authorized to use those credentials
    # and will be able to until the merchant logs out of Github (then they'd have to
    # reenter in their credentials to our app).
    session[:user_id] = nil

    flash[:notice] = "you have successfully logged out"
    redirect_to root_path
  end
end
