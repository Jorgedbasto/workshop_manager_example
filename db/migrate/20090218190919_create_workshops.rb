class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
