class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by_username(params[:username])

    if u.present? && u.password == params[:password]
      session[:user_id] = u.id
      redirect_to movies_url, notice: "Signed in successfully."
    else
      redirect_to new_session_url, notice: "Nice try."
    end
  end

  def destroy
    reset_session
    redirect_to movies_url, notice: "Signed out successfully."
  end
end
