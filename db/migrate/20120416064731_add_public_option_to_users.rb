class AddPublicOptionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :public, :boolean, :default => false
  end

  def self.down
    remove_column :users, :public
  end
end
