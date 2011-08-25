class Devicegrouping < ActiveRecord::Base
  belongs_to :device, :class_name => 'APN::Device'
  belongs_to :group
end
