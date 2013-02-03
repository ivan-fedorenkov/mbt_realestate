class ChangeAdditionalFeaturesFromStringToText < ActiveRecord::Migration
  def change
    change_column :lots, :additional_features, :text
  end
end
