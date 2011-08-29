class Group < ActiveRecord::Base
  has_many :devices, :through => :devicegroupings, :class_name => 'APN::Device'
  has_many :devicegroupings, :dependent => :destroy
  
  attr_accessible :name
  
  validates :name, :presence => true
  
end
