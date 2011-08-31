class Devicegrouping < ActiveRecord::Base
  belongs_to :device, :class_name => 'APN::Device'
  belongs_to :group
  
  attr_accessible :device_id, :group_id
  
<<<<<<< HEAD
  validates :device_id, :numericality => true
  validates :group_id, :numericality => true
=======
  validates :device_id, :numericality => true
  validates :group_id, :numericality => true
>>>>>>> push-notifications
  
end
