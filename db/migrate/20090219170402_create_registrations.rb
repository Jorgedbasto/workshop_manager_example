class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :workshop_id
      t.boolean :confirmed, :default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
