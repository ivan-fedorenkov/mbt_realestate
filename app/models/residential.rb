class Residential < ActiveRecord::Base
  
  attr_accessible :baths, :bedrooms, :communal_pool, 
    :covered_area, :levels, :plot, :price, 
    :private_pool, :title, :residential_type, :description
  
  validates :title, :presence => true
  validates :covered_area,:plot,:price,:bedrooms,:baths,:levels,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  # Residential could be one of the following types
  symbolize :residential_type, :in => 
    {:detached_house => 'Detached House',
     :semi_detached => 'Semi Detached',
     :town_house => 'Town House',
     :apartment => 'Apartment'}
end
