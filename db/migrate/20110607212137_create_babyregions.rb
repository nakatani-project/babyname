class CreateBabyregions < ActiveRecord::Migration
  def self.up
    create_table :babyregions do |t|
      t.integer :baby_id
      t.integer :region_id

      t.timestamps
    end
  end

  def self.down
    drop_table :babyregions
  end
end
