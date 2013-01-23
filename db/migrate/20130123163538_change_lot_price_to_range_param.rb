class ChangeLotPriceToRangeParam < ActiveRecord::Migration
  def up
    remove_column :lots, :price
    add_column :lots, :price_from, :integer
    add_column :lots, :price_to, :integer
  end

  def down
    add_column :lots, :price, :integer, :default => 0
    remove_column :lots, :price_from
    remove_column :lots, :price_to
  end
end
