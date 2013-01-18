class Admin::LocationsController < Admin::BaseController
  
  before_filter :find_locations, :only => [:index, :create]
  before_filter :find_location, :only => [:edit, :update, :destroy]
  
  def index
    @location = Location.new
  end
  
  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:notice] = "Location have been created."
      redirect_to admin_locations_path
    else
      flash[:alert] = "Location have not been created."
      render :action => "index"
    end
  end
  
  def edit
  end

  def update
    if @location.update_attributes(params[:location])
      flash[:notice] = "Location have been updated."
      redirect_to admin_locations_path
    else
      flash[:alert] = "Location have not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @location.destroy
    flash[:notice] = "Location have been destroyed."
    redirect_to admin_locations_path
  end
  
private
  def find_locations
    @locations = Location.all
  end
  
  def find_location
    begin
      @location = Location.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested location could not be found."
      redirect_to admin_locations_path
    end
  end
end
