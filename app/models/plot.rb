class Plot < Lot
  
  attr_accessible :title, :lot_internal_type, :latitude, 
    :longitude, :plot, :price, :description, :location_id,
    :location_
    
  symbolize :lot_internal_type, :in => 
    {:plot => 'Plot',
     :land => 'Land'}
end