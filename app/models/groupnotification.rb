class Groupnotification < ActiveRecord::Base
  after_create :create_notifications #needs to be after for a self.id to be established
  after_update :update_notifications #needs to be after for a self.id to be established
  before_destroy :destroy_notifications
  
  default_scope :order => 'groupnotifications.created_at DESC'
  has_many :notifications, :class_name => 'APN::Notification'
  

  attr_accessible :sound, :alert, :badge, :sent_at, :group_id
  
  #validates (:sound, :presence => true, :inclusion => {:in => ["true", "false"]})
  validates(:alert, :presence => true, :length => { :maximum => 140 }) 
  validates(:badge, :presence => true, :numericality => true)
  validates(:group_id, :presence => true, :numericality => true)
  
  private
  
  #create individual notifications for each device in the group specified in the group notification
  def create_notifications 
    @devices = Group.find_by_id(self.group_id).devices
    @devices.each do |device|
      device.notifications.create(:groupnotification_id => self.id, :sound => self.sound, :alert => self.alert, :badge => self.badge)
    end
  end
  
  #edit individual notifications for each device in the group specified in the group notification
  def update_notifications
    @notifications = self.notifications
    @notifications.each do |n|
      n.update_attributes(:groupnotification_id => self.id, :sound => self.sound, :alert => self.alert, :badge => self.badge)
    end
  end
  
  #delete individual notifications for each device in the group specified in the group notification
  def destroy_notifications
    @notifications = self.notifications
    @notifications.each do |n|
      n.delete
    end   
  end
  

end
