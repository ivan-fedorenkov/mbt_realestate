class Article < ActiveRecord::Base
  attr_accessible :title, :text
  
  validates :title, :text, :presence => true
end
