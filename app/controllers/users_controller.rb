class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])

    if session[:user_id] != @user.id
      redirect_to users_url, notice: "Nice try."
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_url, :notice => "Created successfully."
    else
      redirect_to new_user_url, :notice => "Username taken."
    end
  end

  def edit
    @user = User.find_by_id(params[:id])

    if @user.id != session[:user_id]
      redirect_to users_url, notice: "Nice try."
    end
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.id == session[:user_id]
      @user.username = params[:username]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]

      if @user.save
        redirect_to users_url, :notice => "Updated successfully."
      else
        redirect_to edit_user_url(@user.id), :notice => "Username taken."
      end
    else
      redirect_to users_url, notice: "Nice try."
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if session[:user_id] == @user.id
      @user.destroy
      reset_session
      redirect_to users_url
    else
      redirect_to users_url, notice: "Nice try."
    end
  end
end












