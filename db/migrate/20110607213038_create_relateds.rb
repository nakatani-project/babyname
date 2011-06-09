class CreateRelateds < ActiveRecord::Migration
  def self.up
    create_table :relateds do |t|
      t.integer :baby_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :relateds
  end
end
