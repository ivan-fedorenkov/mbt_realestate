class AddPositionColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :position, :integer, :default => 0
    add_index :articles, :position
  end
end
