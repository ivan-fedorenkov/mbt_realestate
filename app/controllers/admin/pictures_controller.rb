class Admin::PicturesController < Admin::BaseController
  
  before_filter :find_imageable
  
  def index
    @pictures = @imageable.pictures
    @picture = Picture.new
  end
  
  def create
    @pitcures = @imageable.pictures
    @picture = @imageable.pictures.build(params[:picture])
    if @picture.save
      flash[:notice] = "New image have been added."
      redirect_to [:admin, @imageable, :pictures]
    else
      render :action => "index"
    end    
  end
  
  def delete_all
    Picture.destroy_all(:id => params[:pictures_ids])
    flash[:notice] = "Images have been removed."
    redirect_to [:admin, @imageable, :pictures]
  end
  
private 
  def find_imageable
    params.each do |name, value|
      if name =~ /(residential|plot)_id$/
        @imageable = $1.classify.constantize.find(value)
        return
      end
    end
  end
  
end
