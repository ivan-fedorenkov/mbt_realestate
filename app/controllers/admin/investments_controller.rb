class Admin::InvestmentsController < Admin::BaseController

  before_filter :set_investment, :only => [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @investment.update_attributes(params[:investment])
      flash[:notice] = "Investment has been updated."
      redirect_to admin_investment_path(@investment)
    else
      flash[:alert] = "Investment has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @investment.destroy
    flash[:notice] = "Investment has been destroyed."
    redirect_to admin_investments_path
  end

private
  def set_investment
    begin
      @investment = Investment.includes(:pictures).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested investment could not be found."
      redirect_to admin_investments_path
    end
  end
end