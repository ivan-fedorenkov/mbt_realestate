class LotsController < ApplicationController
  
  before_filter :set_lot, :only => [:show]
  
  def index
    @lots = Lot.where(:type => "Residential").order("price_from asc")
    @lot_search_form = LotSearchForm.new
  end  
  
  def show
    @lot_question = LotQuestion.new(:question => "Your question")
  end

  def search
    @lot_search_form = LotSearchForm.new(params[:lot_search_form])
    @lots = Lot.search(params[:lot_search_form])
              .includes(:pictures)
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
