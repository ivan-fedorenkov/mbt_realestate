class AddFieldsToResidential < ActiveRecord::Migration
  def change
    add_column :residentials, :parking, :integer, :default => 0
    add_column :residentials, :latitude, :float, :default => 0.0
    add_column :residentials, :longitude, :float, :default => 0.0
    add_column :residentials, :distance_to_sea, :integer, :default => 0
    add_column :residentials, :opened_veranda, :float, :default => 0.0
    add_column :residentials, :title_deed_ready, :boolean, :default => :false
    change_column :residentials, :covered_area, :float, :default => 0.0
    remove_column :residentials, :description
  end
end
