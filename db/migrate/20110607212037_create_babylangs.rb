class CreateBabylangs < ActiveRecord::Migration
  def self.up
    create_table :babylangs do |t|
      t.integer :baby_id
      t.integer :lang_id
      t.string :pronun
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :babylangs
  end
end
