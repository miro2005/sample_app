class AddCurrentloginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :currentlogin, :string
  end

  def self.down
    remove_column :users, :currentlogin
  end
end
