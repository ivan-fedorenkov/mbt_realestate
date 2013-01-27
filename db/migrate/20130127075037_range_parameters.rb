class RangeParameters < ActiveRecord::Migration
  def up
    remove_column :lots, :plot
    remove_column :lots, :bedrooms
    remove_column :lots, :baths
    remove_column :lots, :covered_area
    remove_column :lots, :opened_veranda
    remove_column :lots, :levels
    remove_column :lots, :parking
    
    add_column :lots, :plot_from, :integer
    add_column :lots, :plot_to, :integer
    
    add_column :lots, :bedrooms_from, :integer
    add_column :lots, :bedrooms_to, :integer
    
    add_column :lots, :baths_from, :integer
    add_column :lots, :baths_to, :integer
    
    add_column :lots, :covered_area_from, :integer
    add_column :lots, :covered_area_to, :integer
    
    add_column :lots, :opened_veranda_from, :integer
    add_column :lots, :opened_veranda_to, :integer
    
    add_column :lots, :levels_from, :integer
    add_column :lots, :levels_to, :integer
    
    add_column :lots, :parking_from, :integer
    add_column :lots, :parking_to, :integer
    
  end

  def down
    remove_column :lots,:plot_from, :plat_from
    remove_column :lots,:plot_to, :plat_from
    
    remove_column :lots,:bedrooms_from, :plat_from
    remove_column :lots,:bedrooms_to, :plat_from
    
    remove_column :lots,:baths_from, :plat_from
    remove_column :lots,:baths_to, :plat_from
    
    remove_column :lots,:covered_area_from, :plat_from
    remove_column :lots,:covered_area_to, :plat_from
    
    remove_column :lots,:opened_veranda_from, :plat_from
    remove_column :lots,:opened_veranda_to, :plat_from
    
    remove_column :lots,:levels_from, :plat_from
    remove_column :lots,:levels_to, :plat_from
    
    remove_column :lots,:parking_from, :plat_from
    remove_column :lots,:parking_to, :plat_from
    
    add_column :lots, :plot, :integer
    add_column :lots, :bedrooms, :integer
    add_column :lots, :baths, :integer
    add_column :lots, :covered_area, :integer
    add_column :lots, :opened_veranda, :integer
    add_column :lots, :levels, :integer
    add_column :lots, :parking, :integer
  end
end
