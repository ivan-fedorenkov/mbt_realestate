class RenameResidentialTableToLot < ActiveRecord::Migration
  def up
    rename_table :residentials, :lots
    add_column :lots, :type, :string
  end

  def down
    remove_column :lots, :type
    rename_table :lots, :residentials
  end
end
