class CreateEvenements < ActiveRecord::Migration
  def self.up
    create_table :evenements do |t|
      t.string :titre
      t.text :detail
      t.string :statut, :default => 'nouveau'
      t.datetime :date
      t.text :adresse
      t.integer :membre_id
      t.integer :region_id
      t.string :whodunit

      t.timestamps
    end
  end

  def self.down
    drop_table :evenements
  end
end
