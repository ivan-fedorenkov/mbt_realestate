class RenameResidentialTypeToLotInternalType < ActiveRecord::Migration
  def change
    rename_column :lots, :residential_type, :lot_internal_type
  end
end
