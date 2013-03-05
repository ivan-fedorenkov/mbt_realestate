class AddTypeIndexToLots < ActiveRecord::Migration
  def change
    add_index :lots, :type
  end
end
