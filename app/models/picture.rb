class Picture < ActiveRecord::Base
  
  attr_accessible :picture
  has_attached_file :picture,
      :styles => { :thumb => ["116x90>", :png], :big => ["620x410>", :png] },
      :storage => :dropbox, 
      :dropbox_credentials => {
        :app_key => "pxeb46rajwqc67y", 
        :app_secret => "v5ird3hbrk3kv75", 
        :access_token => "71jg9eo2l2x3q9v", 
        :access_token_secret => "70d9w22lc5w63ss", 
        :access_type => "dropbox", 
        :user_id => "52135757" 
      },
      :dropbox_options => {
        :path => proc { |style| "Apps/MBT/pictures/#{style}/#{id}_#{picture.original_filename}" }
      }
      
  belongs_to :imageable, :polymorphic => true

end
