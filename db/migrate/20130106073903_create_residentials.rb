class CreateResidentials < ActiveRecord::Migration
  def change
    create_table :residentials do |t|
      t.string :title
      t.string :residential_type
      t.text :description
      t.integer :levels, :default => 0
      t.integer :bedrooms, :default => 0
      t.integer :covered_area, :default => 0
      t.integer :baths, :default => 0
      t.integer :plot, :default => 0
      t.integer :price, :default => 0
      t.boolean :private_pool, :default => false
      t.boolean :communal_pool, :default => false

      t.timestamps
    end
  end
end
