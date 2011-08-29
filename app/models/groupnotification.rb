class Groupnotification < ActiveRecord::Base
  default_scope :order => 'groupnotifications.created_at DESC'
  has_many :notifications, :class_name => 'APN::Notification'
  

  attr_accessible :sound, :alert, :badge, :sent_at, :group_id
  
  #validates (:sound, :presence => true, :inclusion => {:in => ["true", "false"]})
  validates(:alert, :presence => true, :length => { :maximum => 140 }) 
  validates(:badge, :presence => true, :numericality => true)
  validates(:group_id, :presence => true, :numericality => true)
  

end
