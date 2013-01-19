class AddLocationReferenceToResidential < ActiveRecord::Migration
  def change
    add_column :residentials, :location_id, :integer
    add_index :residentials, :location_id
  end
end
