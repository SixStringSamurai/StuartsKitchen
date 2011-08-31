class AddGroupnotificationIndexToNotifications < ActiveRecord::Migration
  def self.up
    add_column :apn_notifications, :groupnotification_id, :integer
  end

  def self.down
    remove_column :apn_notifications, :groupnotification_id
  end
end
