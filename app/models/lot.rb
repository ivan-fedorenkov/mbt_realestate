class Lot < ActiveRecord::Base

  has_many :pictures, :as => :imageable
  belongs_to :location
  
  validates :title, :location, :presence => true
  validates :price, :plot, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :latitude, :longitude, :numericality => { :greater_than => 0.0 }
  
  def lat_long
    "#{latitude.to_s},#{longitude.to_s}"
  end
  
end
