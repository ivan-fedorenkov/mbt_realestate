class AddAdditionalFeaturesColumnToResidentials < ActiveRecord::Migration
  def change
    add_column :residentials, :additional_features, :string
  end
end
