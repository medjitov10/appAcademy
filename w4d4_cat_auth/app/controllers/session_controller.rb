class SessionController < ApplicationController
  def create
    user = User.find_by_credentials(
    params[:user][:user_name],
    params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorect username or password"]
      render :new
    else
      login_user!(user)
      redirect_to cats_url
    end
  end

  def destroy
   logout_user!
   redirect_to new_session_url
  end

  def new

  end

end
