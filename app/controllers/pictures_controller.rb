class PicturesController < ApplicationController
  
  before_filter :find_imageable
  
  def index
    @pictures = @imageable.pictures
    @picture = Picture.new
  end
  
  def create
    @picture = @imageable.pictures.build(params[:picture])
    if @picture.save
      flash[:notice] = "New image have been added."
      redirect_to :id => nil
    else
      render :action => "show"
    end    
  end
  
private 
  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @imageable = $1.classify.constantize.find(value)
        return
      end
    end
  end
  
end
