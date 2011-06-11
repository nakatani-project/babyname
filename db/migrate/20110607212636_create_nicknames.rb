class CreateNicknames < ActiveRecord::Migration
  def self.up
    create_table :nicknames do |t|
      t.integer :babylang_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :nicknames
  end
end
