class GroupnotificationsController < ApplicationController

  before_filter :signed_in? 
  
  def index
    @groupnotifications = Groupnotification.all
  end
  
  def new
    @groupnotification = Groupnotification.new
  end
  
  def edit
    @groupnotification = Groupnotification.find(params[:id])
  end
  
  def show
    @groupnotification = Groupnotification.find(params[:id])
  end
  
  def create
    @groupnotification = Groupnotification.new(params[:groupnotification])
    if @groupnotification.save
      redirect_to groupnotifications_path, flash[:notice] => "New group notification created!"
    else
      render "new"
    end
  end
  
  def update
    @groupnotification = Groupnotification.find(params[:id])
    if @groupnotification.update_attributes(params[:groupnotification])
      flash[:success] = "Group notification updated."
      redirect_to @groupnotification
    else
      @title = "Edit group notification"
      render 'edit'\
    end
  end
  
 
  def destroy
    Groupnotification.find(params[:id]).destroy
    flash[:success] = "Group notification destroyed."
    redirect_to groupnotifications_path
  end
   
  def send_notification
    flash[:notice] = "Send function invoked."
    redirect_to groupnotifications_path
  end
  
end


