class CreateShorts < ActiveRecord::Migration
  def self.up
    create_table :shorts do |t|
      t.integer :babylang_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :shorts
  end
end
