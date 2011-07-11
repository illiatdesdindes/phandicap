class CreateCandidatures < ActiveRecord::Migration
  def self.up
    create_table :candidatures do |t|
      t.string :nom
      t.text :adresse
      t.string :telephone
      t.string :mail
      t.text :evenement
      t.string :statu, :default => "nouvelle"

      t.timestamps
    end
  end

  def self.down
    drop_table :candidatures
  end
end
