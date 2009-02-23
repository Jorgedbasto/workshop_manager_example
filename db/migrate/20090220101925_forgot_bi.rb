class ForgotBi < ActiveRecord::Migration
  def self.up
    add_column :users, :bi, :string
  end

  def self.down
    remove_column :users, :bi
  end
end
