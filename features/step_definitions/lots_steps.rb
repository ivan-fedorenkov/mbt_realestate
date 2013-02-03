#encoding: utf-8

Допустим /^на сайте размещены следующие лоты:$/ do |lots|

  lots.map_headers!(
    "Title" => :title,
    "Type" => :type,
    "Location" => :location,
    "Price" => :price)

  lots.hashes.each do | lot_params |
    location = Location.find_by_name(lot_params[:location])
    lot_params[:location] = location
    FactoryGirl.create(:lot, lot_params)
  end
end