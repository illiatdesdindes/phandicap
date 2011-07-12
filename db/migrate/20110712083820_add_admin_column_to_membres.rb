class AddAdminColumnToMembres < ActiveRecord::Migration
  def self.up
    add_column :membres, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :membres, :admin
  end
end
