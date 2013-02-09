class Admin::PlotsController < Admin::BaseController
  
  before_filter :set_locations, :except => [:index, :show]
  before_filter :set_plot, :only => [:show, :edit, :update, :destroy]
  
  def index
    @plots = Plot.all
  end
  
  def new
    @plot = Plot.new
  end
  
  def create
    @plot = Plot.new(params[:plot])
    if @plot.save
      flash[:notice] = "Plot has has created."
      redirect_to admin_plot_path(@plot)
    else
      flash[:alert] = "Plot has not been created."
      render :action => "new"
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @plot.update_attributes(params[:plot])
      flash[:notice] = "Plot has been updated."
      redirect_to admin_plot_path(@plot)
    else
      flash[:alert] = "Plot has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @plot.destroy
    flash[:notice] = "Plot has been deleted."
    redirect_to admin_plots_path
  end

private
  def set_locations
    @locations = Location.all
  end
  
  def set_plot
    begin
      @plot = Plot.includes(:pictures).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested plot could not be found."
      redirect_to admin_plots_path
    end
  end
  
end
