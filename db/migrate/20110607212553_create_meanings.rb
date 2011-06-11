class CreateMeanings < ActiveRecord::Migration
  def self.up
    create_table :meanings do |t|
      t.integer :babylang_id
      t.string :character
      t.string :meaning

      t.timestamps
    end
  end

  def self.down
    drop_table :meanings
  end
end
