class ResidentialController < ApplicationController
  
  before_filter :find_residential, :only => [:show,:edit,:update]
  
  def index
    @residential = Residential.all
  end  
  
  def show
  end

  def new
    @residential = Residential.new
  end
  
  def create
    @residential = Residential.new(params[:residential])
    if @residential.save
      flash[:notice] = "Residential has been created."
      redirect_to residential_index_path
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
      redirect_to residential_index_path
    else
      flash[:alert] = "Residential has not been updated."
      render :action => "edit"
    end
  end
  
private 
  def find_residential
    begin
      @residential = Residential.includes(:pictures).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested residential could not be found."
      redirect_to root_path
    end
  end
  
end
