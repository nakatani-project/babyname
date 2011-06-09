class CreateCelebs < ActiveRecord::Migration
  def self.up
    create_table :celebs do |t|
      t.integer :baby_id
      t.string :last_name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :celebs
  end
end
