class AddIncludeVatToLot < ActiveRecord::Migration
  def change
    add_column :lots, :include_vat, :boolean
  end
end
