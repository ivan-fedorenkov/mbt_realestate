class Admin::LotsController < Admin::BaseController

  before_filter :set_lot, :only => [:show, :edit, :update, :destroy]

  def index
    @lots = lot_class.all
  end

  def new
    @lot = lot_class.new
  end

  def create
    @lot = lot_class.new(params[lot_class_name.downcase.to_sym])
    if @lot.save
      flash[:notice] = "#{lot_class_name} has been created."
      redirect_to [:admin, @lot]
    else
      flash[:alert] = "#{lot_class_name} has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @lot.update_attributes(params[lot_class_name.downcase.to_sym])
      flash[:notice] = "#{lot_class_name} has been updated."
      redirect_to [:admin, @lot]
    else
      flash[:alert] = "#{lot_class_name} has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @lot.destroy
    flash[:notice] = "#{lot_class_name} has been deleted."
    
    redirect_to lot_index_path
  end

private
  def lot_class
    params[:type].constantize
  end

  def lot_class_name
    lot_class.to_s
  end

  def lot_index_path
    return case lot_class_name
      when "Residential" 
        admin_residential_index_path
      when "Investment"
        admin_investments_path
      when "Plot"
        admin_plots_path
    end
  end

  def set_lot
    begin
      @lot = Lot.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_root_path
    end
  end 
end