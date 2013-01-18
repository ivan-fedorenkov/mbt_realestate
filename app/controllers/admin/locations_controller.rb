class Admin::LocationsController < Admin::BaseController
  
  before_filter :find_locations, :only => [:index, :create]
  
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
  
private
  def find_locations
    @locations = Location.all
  end
end
