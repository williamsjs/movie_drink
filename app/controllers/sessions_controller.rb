class SessionsController < ApplicationController
  def login
    @user = User.new
    if request.post?
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to characters_index_path
      else
        flash[:notice] = "Invalid Email or Password"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to sessions_login_path, notice: "Successfully logged out!"
  end
end
