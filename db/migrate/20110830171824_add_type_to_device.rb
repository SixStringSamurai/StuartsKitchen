class AddTypeToDevice < ActiveRecord::Migration
  def self.up
    add_column :apn_devices, :device_type, :string
  end

  def self.down
    remove_column :apn_devices, :device_type
  end
end

