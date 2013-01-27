class Admin::InvestmentsController < Admin::BaseController

  before_filter :set_locations, :except => [:index, :show]
  before_filter :set_investment, :only => [:show]

  def index
    @investments = Investment.all
  end

  def show

  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(params[:investment])
    if @investment.save
      flash[:notice] = "Investment has been created."
      redirect_to admin_investment_path(@investment)
    else
      flash[:alert] = "Investment has not been created."
      render :action => "new"
    end
  end

private
  def set_locations
    @locations = Location.all
  end

  def set_investment
    begin
      @investment = Investment.includes(:pictures).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested investment could not be found."
      redirect_to admin_investments_path
    end
  end
end