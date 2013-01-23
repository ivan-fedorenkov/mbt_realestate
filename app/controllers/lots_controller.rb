class LotsController < ApplicationController
  
  before_filter :set_lot, :only => [:show]
  
  def index
    @lots = Lot.all
    @residential_search_form = ResidentialSearchForm.new
  end  
  
  def show
  end

  def search
    search_params = {}
    search_params[:location_id] = params[:location_id] unless params[:location_id].empty?
    search_params[:lot_internal_type] = params[:lot_internal_type] unless params[:lot_internal_type].empty?

    @lots = Lot.where(search_params)

    @lots = @lots.where("price_from >= ?", params[:price_from]) unless params[:price_from].empty?
    @lots = @lots.where("(price_to <= ?) or (price_to is null and price_from <= ?)", params[:price_to], params[:price_to]) unless params[:price_to].empty?
    @lots = @lots.where("type = ?", params[:type]) unless params[:type].empty?
  end

private 
  def set_lot
    begin
      @lot = Lot.includes(:pictures).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested lot could not be found."
      redirect_to root_path
    end
  end
  
end
