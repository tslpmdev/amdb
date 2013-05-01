class RolesController < ApplicationController

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find_by_id(params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new
    @role.character_name = params[:character_name]
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]
    
    if @role.save
            redirect_to roles_url
          else
      render 'new'
    end
  end

  def edit
    @role = Role.find_by_id(params[:id])
  end

  def update
    @role = Role.find_by_id(params[:id])
    @role.character_name = params[:character_name]
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]
    
    if @role.save
            redirect_to roles_url
          else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find_by_id(params[:id])
    @role.destroy
        redirect_to roles_url
      end
end
