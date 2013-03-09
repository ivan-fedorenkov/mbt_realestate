class DropLocationsTable < ActiveRecord::Migration
  def up
    drop_table :locations
    remove_column :lots, :location_id
    rename_column :lots, :location_, :location
  end

  def down
    create_table(:locations) do |t|
      t.string name
    end
    add_index :locations, :name, :unique => true
    add_column :lots, :location_id, :integer
    rename_column :lots, :location, :location_
  end
end
