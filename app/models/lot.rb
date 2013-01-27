class Lot < ActiveRecord::Base

  has_many :pictures, :as => :imageable
  belongs_to :location
  
  range_fields :price, :plot, :bedrooms, :baths, :covered_area, :opened_veranda, :levels, :parking
  
  validates :title, :location, :presence => true
  
  validates :title_deed_ready, :private_pool, :communal_pool, :include_vat,
    :inclusion => { :in => [true, false] },
    :allow_nil => true
  
  validates :price_from, :price_to,
    :distance_to_sea, 
    :plot_from, :plot_to,
    :bedrooms_from, :bedrooms_to,
    :baths_from, :baths_to,
    :levels_from, :levels_to,
    :parking_from, :parking_to,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 },
    :allow_nil => true

  validates :latitude, :longitude,
    :covered_area_from, :covered_area_to,
    :opened_veranda_from, :opened_veranda_to,
    :numericality => { :greater_than => 0.0 },
    :allow_nil => true

  
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

  def lat_long
    "#{latitude.to_s},#{longitude.to_s}"
  end
  
end
