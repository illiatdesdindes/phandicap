class RenameDetailToDescriptionForEvenement < ActiveRecord::Migration
  def self.up
    rename_column :evenements, :detail, :description
  end

  def self.down
    rename_column :evenements, :description, :detail
  end
end
