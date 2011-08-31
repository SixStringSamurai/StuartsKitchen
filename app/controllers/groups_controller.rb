class GroupsController < ApplicationController

  before_filter :signed_in? 
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
   
  def show
    @group = Group.find(params[:id])
  end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to groups_path, flash[:notice] => "New group created!"
    else
      render "new"
    end
  end
  
  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group destroyed."
    redirect_to groups_path
  end

end


  
   
 

