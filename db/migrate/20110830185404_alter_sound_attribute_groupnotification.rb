class AlterSoundAttributeGroupnotification < ActiveRecord::Migration
  def self.up
    remove_column :groupnotifications, :sound
    add_column :groupnotifications, :sound, :string
  end

  def self.down
  end
end
