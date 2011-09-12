class GroupnotificationsController < ApplicationController

  before_filter :signed_in?
  before_filter :timestamp_check, :only => [:index]
   
  
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
      render 'edit'
    end
  end
  
 
  def destroy
    Groupnotification.find(params[:id]).destroy
    flash[:success] = "Group notification destroyed."
    redirect_to groupnotifications_path
  end
   
  def dispatch_gn
    flash[:notice] = "Send function invoked, sending notifications..."
    notes = Groupnotification.find(params[:id]).notifications
    APN::Notification.send_notifications(notes)
    redirect_to groupnotifications_path
  end

  def timestamp_check
    if Groupnotification.where(:sent_at=>nil).any?
      Groupnotification.where(:sent_at=>nil).each do |gn|
        if gn.notifications.where(:sent_at=>nil).empty?
          gn.update_attribute(:sent_at, gn.notifications.last.sent_at)
          gn.notifications.each do |n|
            n.delete
          end
        end
      end
    end
  end
  
end


