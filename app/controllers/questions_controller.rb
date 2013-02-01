class QuestionsController < ApplicationController
  before_filter :set_lot

  def create
    @lot_question = LotQuestion.new(params[:lot_question])
    if @lot_question.valid?
      Notifier.new_lot_question(@lot, @lot_question).deliver
      flash[:notice] = "Your question have been sent to the agent."
      redirect_to lot_path(@lot)
    else
      flash[:alert] = "Please fill in the from fields correctly."
      render 'lots/show'
    end
  end

private
  def set_lot
    begin
      @lot = Lot.find(params[:lot_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested lot could not be found."
      redirect_to root_path
    end
  end  
end