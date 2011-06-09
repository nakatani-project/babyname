class CreateOriginlangs < ActiveRecord::Migration
  def self.up
    create_table :originlangs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :originlangs
  end
end
