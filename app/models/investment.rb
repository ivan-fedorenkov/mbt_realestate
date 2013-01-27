class Investment < Lot

  attr_accessible :baths, :bedrooms, :communal_pool, 
    :covered_area, :levels, :plot, :price, 
    :private_pool, :title, :lot_internal_type,
    :additional_features, :title_deed_ready, :include_vat,
    :location_id, :latitude, :longitude, :opened_veranda, 
    :distance_to_sea, :parking, :description, :include_vat

  symbolize :lot_internal_type, :in => 
    {:detached_house => 'Detached House',
     :semi_detached => 'Semi Detached',
     :town_house => 'Town House',
     :apartment => 'Apartment'}
end