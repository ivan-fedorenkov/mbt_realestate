class Picture < ActiveRecord::Base
  
  attr_accessible :picture
  has_attached_file :picture,
      :styles => { :thumb => ["116x90>"], :big => ["620x410>"] }


      
  belongs_to :imageable, :polymorphic => true

end
