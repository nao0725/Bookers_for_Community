class GroupsController < ApplicationController
  
  def index
  end 
  
  def show
  end 
  
  def new
  end 
  
  def create
  end 
  
  def edit
  end 
  
  def update
  end 
  
  private
  
  def group_params
    params.require(:group).permit(:name, user_ids: [] ) 
  end
  
end
