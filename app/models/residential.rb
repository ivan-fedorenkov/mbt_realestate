class Residential < ActiveRecord::Base
  
  has_many :pictures, :as => :imageable
  belongs_to :location
  
  attr_accessible :baths, :bedrooms, :communal_pool, 
    :covered_area, :levels, :plot, :price, 
    :private_pool, :title, :residential_type,
    :additional_features, :title_deed_ready, 
    :location_id, :latitude, :longitude, :opened_veranda, 
    :distance_to_sea, :parking
  
  validates :title, :location, :presence => true
  validates :price,:levels,:bedrooms,:baths,:plot,:distance_to_sea,:parking,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :latitude,:longitude,:covered_area,:opened_veranda,
    :numericality => { :greater_than => 0.0 }
    
  # Residential could be one of the following types
  symbolize :residential_type, :in => 
    {:detached_house => 'Detached House',
     :semi_detached => 'Semi Detached',
     :town_house => 'Town House',
     :apartment => 'Apartment'}
     
  validates :additional_features, 
    :format => { :with => Features.validation_format }, 
    :allow_nil => true, 
    :allow_blank => true
     
  after_initialize :initialize_features
  
  def initialize_features
    @features = Features.new(additional_features)
  end
  
  def features
    @features.to_hash
  end
     
end
