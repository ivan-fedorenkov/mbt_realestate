class Picture < ActiveRecord::Base
  
  attr_accessible :picture
  has_attached_file :picture,
      :styles => { :thumb => ["116x90>", :jpg], :big => ["620x410>", :jpg] },
      :dropbox_options => {
        :path => proc { |style| "MBT/pictures/#{style}/#{id}_#{picture.original_filename}" }
      }
      
  belongs_to :imageable, :polymorphic => true

end
