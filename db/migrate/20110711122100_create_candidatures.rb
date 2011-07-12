class CreateCandidatures < ActiveRecord::Migration
  def self.up
    create_table :candidatures do |t|
      t.text :evenement
      t.string :statut, :default => "nouvelle"
      t.integer  :membre_id
      t.timestamps
    end
  end

  def self.down
    drop_table :candidatures
  end
end
