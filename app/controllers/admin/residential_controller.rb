class Admin::ResidentialController < Admin::BaseController
  before_filter :find_residential, :only => [:show, :edit, :update, :destroy]
  before_filter :find_locations, :except => [:index, :show]
  
  def index
    @residential = Residential.all
  end
  
  def new
    @residential = Residential.new
  end
  
  def create
    @residential = Residential.new(params[:residential])
    if @residential.save
      flash[:notice] = "Residential has been created."
      redirect_to admin_residential_path(@residential)
    else
      flash[:alert] = "Residential has not been created."
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @residential.update_attributes(params[:residential])
      flash[:notice] = "Residential has been updated."
      redirect_to admin_residential_path(@residential)
    else
      flash[:alert] = "Residential has not been updated."
      render :action => "edit"
    end
  end
  
  def show
  end

  def destroy
    @residential.destroy
    flash[:notice] = "Residential has been deleted."
    redirect_to admin_residential_index_path
  end

private
  def find_residential
    begin
      @residential = Residential.includes(:pictures).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested residential could not be found."
      redirect_to admin_residential_index_path
    end
  end
  
  def find_locations
    @locations = Location.all
  end
  
end