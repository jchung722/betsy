class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    # check to see if we have id from auth_hash. if not, we will redirect
    # in this case, back to login page
    if ! auth_hash['uid']
      flash[:notice] = "login failed"
      return redirect_to root_path
    end

    @merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github').to_i
    if @merchant.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      # This is only because we're building a stub app, should redirect to new user creation
      @merchant = Merchant.build_from_github(auth_hash)
      flash[:notice] = "Unable to save this Merchant"
      # return render :creation_failure unless @user.save
      return redirect_to root_path unless @merchant.save

      # Could add an else here that refreshes/updates the information from Github
    end

    # Save the user ID in the session (**not the :uid from GitHub**)
    # In background, Rails encrypts this before it's saved in the browser
    session[:user_id] = @merchant.id

    # redirect_to sessions_path
    flash[:notice] = "successfully logged in"
    redirect_to root_path
  end

  def index
  end

  def destroy
    session[:user_id] = nil
  end
end
