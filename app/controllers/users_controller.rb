class UsersController < ApplicationController

  before_filter :find_user, except: [:new, :create, :index]
  before_filter :authorize_user, only: [:show, :update, :destroy, :edit]

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def authorize_user
    if @user.id != session[:user_id]
      redirect_to users_url, notice: "Nice try."
    end
  end

  def index
    @users = User.all
  end

  def show
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
  end

  def update
    @user.username = params[:username]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to users_url, :notice => "Updated successfully."
    else
      redirect_to edit_user_url(@user.id), :notice => "Username taken."
    end
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to users_url
  end
end












