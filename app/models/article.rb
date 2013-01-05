class Article < ActiveRecord::Base
  attr_accessible :title, :text, :position
  
  validates :title, :text, :presence => true
  validates :position, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end
