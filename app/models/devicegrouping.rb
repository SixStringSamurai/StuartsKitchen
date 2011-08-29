class Devicegrouping < ActiveRecord::Base
  belongs_to :device, :class_name => 'APN::Device'
  belongs_to :group
  
  attr_accessible :device_id, :group_id
  
  validates (:device_id, :numericality => true)
  validates (:group_id, :numericality => true)
  
end
