class ActorsController < ApplicationController

  def index
    @actors = Actor.all

    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @actors }
    end
  end

  def show
    @actor = Actor.find_by_id(params[:id])

    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @actor.roles }
    end
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(params[:actor])

    if @actor.save
      redirect_to actors_url
    else
      render 'new'
    end
  end

  def edit
    @actor = Actor.find_by_id(params[:id])
  end

  def update
    @actor = Actor.find_by_id(params[:id])

    if @actor.update_attributes(params[:actor])
      redirect_to @actor
    else
      render 'edit'
    end
  end

  def destroy
    @actor = Actor.find_by_id(params[:id])
    @actor.destroy
        redirect_to actors_url
      end
end
