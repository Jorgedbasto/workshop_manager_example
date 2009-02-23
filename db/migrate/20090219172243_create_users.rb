class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.boolean :vip, :default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
