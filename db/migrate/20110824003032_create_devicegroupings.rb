class CreateDevicegroupings < ActiveRecord::Migration
  def self.up
    create_table :devicegroupings do |t|
      t.integer :device_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :devicegroupings
  end
end
