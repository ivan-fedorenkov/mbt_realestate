class RemoveDefaultValuesFromLotColumns < ActiveRecord::Migration
  def up
    change_column :lots, :distance_to_sea, :integer, :default => nil
    change_column :lots, :title_deed_ready, :boolean, :default => nil
    change_column :lots, :communal_pool, :boolean, :default => nil
    change_column :lots, :private_pool, :boolean, :default => nil
  end
  
  def down
    change_column :lots, :distance_to_sea, :integer, :default => 0
    change_column :lots, :title_deed_ready, :boolean, :default => false
    change_column :lots, :communal_pool, :boolean, :default => false
    change_column :lots, :private_pool, :boolean, :default => false
  end
end
