class LotsController < ApplicationController
  
  before_filter :set_lot, :only => [:show]
  
  def index
    @lots = Lot.all
  end  
  
  def show
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
