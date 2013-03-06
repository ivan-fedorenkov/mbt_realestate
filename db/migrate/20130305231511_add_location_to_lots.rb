class AddLocationToLots < ActiveRecord::Migration
  def up
    add_column :lots, :location_, :string
    Lot.all.each do |lot|
      lot.location_ = lot.location.name
      lot.save!
    end
  end

  def down
    remove_column :lots, :location_
  end
end
