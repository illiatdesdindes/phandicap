class AddWhodunitAttrToCandidatures < ActiveRecord::Migration
  def self.up
    add_column :candidatures, :whodunit, :string
  end

  def self.down
    remove_column :candidatures, :whodunit
  end
end
