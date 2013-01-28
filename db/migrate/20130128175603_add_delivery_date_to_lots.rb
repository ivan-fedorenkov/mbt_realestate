class AddDeliveryDateToLots < ActiveRecord::Migration
  def change
    add_column :lots, :delivery_date, :date
  end
end
