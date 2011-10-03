class AddResponsableToMembre < ActiveRecord::Migration
  def self.up
    add_column :membres, :responsable, :string
  end

  def self.down
    remove_column :membres, :responsable
  end
end
