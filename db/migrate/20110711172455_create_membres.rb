class CreateMembres < ActiveRecord::Migration
  def self.up
    create_table :membres do |t|
      t.string :nom
      t.string :mail
      t.text :adresse
      t.string :telephone

      t.timestamps
    end
  end

  def self.down
    drop_table :membres
  end
end
