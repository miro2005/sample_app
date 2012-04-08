class AddLastloginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :lastlogin, :string
  end

  def self.down
    remove_column :users, :lastlogin
  end
end
