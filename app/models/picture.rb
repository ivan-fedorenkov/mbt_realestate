class Picture < ActiveRecord::Base
  
  attr_accessible :picture
  has_attached_file :picture,
      :styles => { :thumb => ["116x90>", :jpg], :big => ["620x410>", :jpg] },
      :path => "MBT/pictures/:style/:id_:basename.:content_type_extension"

      
  belongs_to :imageable, :polymorphic => true

end
