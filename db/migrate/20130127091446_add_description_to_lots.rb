class AddDescriptionToLots < ActiveRecord::Migration
  def change
    add_column :lots, :description, :text
  end
end
