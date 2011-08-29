class CreateGroupnotifications < ActiveRecord::Migration
  def self.up
    create_table :groupnotifications do |t|
      t.integer :group_id
      t.boolean :sound
      t.string :alert
      t.integer :badge
      t.datetime :sent_at

      t.timestamps
    end
  end

  def self.down
    drop_table :groupnotifications
  end
end
