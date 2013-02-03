class LotsController < ApplicationController
  
  before_filter :set_lot, :only => [:show]
  
  def index
    @lots = Lot.all
    @lot_search_form = LotSearchForm.new
  end  
  
  def show
    @lot_question = LotQuestion.new(:question => "Your question")
  end

  def search
    @residential_search_form = ResidentialSearchForm.new
    
    search_params = {}
    search_params[:location_id] = params[:lot_search_form][:location_id] unless params[:lot_search_form][:location_id].empty?
    search_params[:type] = params[:lot_search_form][:type] unless params[:lot_search_form][:type].empty?

    @lots = Lot.where(search_params)

    @lots = @lots.where("price_from >= ?", params[:lot_search_form][:price_from]) unless params[:lot_search_form][:price_from].empty?
    @lots = @lots.where("(price_to <= ?) or (price_to is null and price_from <= ?)", params[:lot_search_form][:price_to], params[:lot_search_form][:price_to]) unless params[:lot_search_form][:price_to].empty?
    @lots = @lots.where("type = ?", params[:lot_search_form][:type]) unless params[:lot_search_form][:type].empty?
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
