class CreateBabies < ActiveRecord::Migration
  def self.up
    create_table :babies do |t|
      t.string :name
      t.integer :lang_count
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :babies
  end
end
