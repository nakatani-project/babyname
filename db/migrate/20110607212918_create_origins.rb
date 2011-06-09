class CreateOrigins < ActiveRecord::Migration
  def self.up
    create_table :origins do |t|
      t.integer :baby_id
      t.string :name
      t.integer :originlang_id

      t.timestamps
    end
  end

  def self.down
    drop_table :origins
  end
end
