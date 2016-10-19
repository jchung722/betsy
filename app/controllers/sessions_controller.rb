class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    # check to see if we have id from auth_hash. if not, we will redirect
    # in this case, back to login page
    if ! auth_hash['uid']
      flash[:notice] = "login failed"
      return redirect_to :back
    end

    @merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github').to_i
    if @merchant.nil?
      # If merchant doesn't match anything in the DB, attempt to create a new user.
      @merchant = Merchant.build_from_github(auth_hash)
      flash[:notice] = "Unable to save this Merchant"

      return redirect_to merchant_index_path unless @merchant.save

    end

    # Save the user ID in the session (**not the :uid from GitHub**)
    session[:user_id] = 4#@merchant.id

    flash[:notice] = "successfully logged in"
    redirect_to merchant_index_path
  end

  def index
  end

  def destroy
    session[:user_id] = nil

    flash[:notice] = "you have successfully logged out"
    redirect_to root_path
  end
end
