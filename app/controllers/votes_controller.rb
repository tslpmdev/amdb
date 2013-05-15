class VotesController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :authorize_user, only: [:show, :edit, :update, :destroy]

  def require_signed_in_user
    unless signed_in?
      redirect_to new_session_url, notice: "Must be signed in for that."
    end
  end

  def authorize_user
    @vote = Vote.find_by_id(params[:id])

    if @vote.user_id != session[:user_id]
      redirect_to votes_url, notice: "Nice try."
    end
  end

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find_by_id(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
      redirect_to votes_url
    else
      render 'new'
    end
  end

  def edit
    @vote = Vote.find_by_id(params[:id])
  end

  def update
    @vote = Vote.find_by_id(params[:id])
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
            redirect_to votes_url
          else
      render 'edit'
    end
  end

  def destroy
    @vote = Vote.find_by_id(params[:id])
    @vote.destroy
        redirect_to votes_url
      end
end
