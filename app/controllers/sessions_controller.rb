class SessionsController < ApplicationController
  def create
    # Build the auth_hash from the Github hash object
    auth_hash = request.env['omniauth.auth']

    # Check to see if we received the auth_hash from Github.
    flash[:notice] = "login failed"
    redirect_to root_path unless auth_hash['uid']

    @merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github')
    if @merchant == nil
      # If merchant doesn't match any record in the DB, attempt to create a new merchant.
      # The method to create the new Merchant (build_from_github) is defined in the
      # Merchant model.
      @merchant = Merchant.build_from_github(auth_hash)

      # Save the Merchant ID in the session (**not the :uid from GitHub**)
      session[:user_id] = @merchant.id

      ##### Once Brandi's code is integrated, we can uncomment the below and
      ##### delete the line above
      redirect_to root_path
      # return redirect_to merchant_edit_path(@merchant.id)

    end

    session[:user_id] = @merchant.id

    flash[:notice] = "successfully logged in"
    redirect_to merchant_index_path
  end

  def index
    @merchant = Merchant.find(session[:user_id])
  end

  def destroy
    # Note: the does not log the merchant out of their Github account, which is why
    # when a merchant logs out and then logs back in, they do not have to re-enter
    # their credentials; the application has been authorized to use those credentials
    # and will be able to until the merchant logs out of Github (then they'd have to
    # reenter in their credentials to our app).
    session[:user_id] = nil

    flash[:notice] = "successfully logged out"
    redirect_to root_path
  end
end
