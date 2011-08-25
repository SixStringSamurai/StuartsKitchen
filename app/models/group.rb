class Group < ActiveRecord::Base
  has_many :devices, :through => :devicegroupings, :class_name => 'APN::Device'
  has_many :devicegroupings, :dependent => :destroy
end
