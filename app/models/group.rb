class Group < ActiveRecord::Base
  has_many :devices, :through => :devicegroupings, :class_name => 'APN::Device'
  has_many :devicegroupings, :dependent => :destroy
  
  has_many :groupnotifications, :dependent => :destroy
  has_many :notifications, :through => :groupnotifications
  
  attr_accessible :name
  
  validates :name, :presence => true
  
end
