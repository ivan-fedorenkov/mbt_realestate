class Picture < ActiveRecord::Base
  
  attr_accessible :picture
  has_attached_file :picture,
      :styles => { :thumb => ["116x90>", :png], :big => ["620x410>", :png] } 
      #:storage => :dropbox, 
      #:dropbox_credentials => {
      #  :app_key => "wddwaipvyvznn1x", 
      #  :app_secret => "t4qb91chxn8mv76", 
      #  :access_token => "zsa8k7j4xv6ebbw", 
      #  :access_token_secret => "9ldfui06gtldh9o", 
      #  :access_type => "app_folder", 
      #  :user_id => "52135757" 
      #},
      #:dropbox_options => {
      #  :path => proc { |style| "residential_pictures/#{style}/#{id}_#{picture.original_filename}" }
      #}
      
  belongs_to :imageable, :polymorphic => true

end
