class AddLocationIndexToLots < ActiveRecord::Migration
  def change
    add_index :lots, :location
  end
end
