require 'spec_helper'

describe QuestionsController do

  context "lot found" do

    let (:lot) do 
      @lot = double("a lot object")
      @lot.stub(:id).and_return(double("a lot identifier"))
      @lot
    end

    before(:each) do
      Lot.stub(:find).and_return(lot)
    end

    def send_lot_question!(lot_question)
      post :create, :lot_id => lot.id, :lot_question => lot_question
    end

    context "invalid filled question fields" do

      let(:invalid_lot_question) do
        @invalid_lot_question = double("invalid lot question")
        @invalid_lot_question.stub(:valid?).and_return(false)
        @invalid_lot_question
      end

      before(:each) do
        LotQuestion.stub(:new).and_return(invalid_lot_question)
      end

      it "should redirect back to lot page and set error flash message" do
        send_lot_question!(:invalid_lot_question)
        flash[:alert].should_not be_nil
        response.should render_template('lots/show')
      end
    end

    context "valid filled question fields" do
      let(:valid_lot_question) do
        @valid_lot_question = double("valid lot question")
        @valid_lot_question.stub(:valid?).and_return(true)
        @valid_lot_question
      end

      let(:mailer) do
        @mailer = double("mailer double")
        @mailer.should_receive(:deliver)
        @mailer
      end

      before(:each) do
        LotQuestion.stub(:new).and_return(valid_lot_question)
      end

      it "should send an email notification" do
        Notifier.should_receive(:new_lot_question).with(lot, valid_lot_question).and_return(mailer)
        send_lot_question!(valid_lot_question)
      end

      it "should render lot page and set a success flash message" do
        Notifier.stub(:new_lot_question).and_return(mailer)
        send_lot_question!(valid_lot_question)
        flash[:notice].should_not be_nil
        response.should redirect_to(lot_path(lot))
      end
    end
  end

  context "lot not found" do
    controller(QuestionsController) do
      def index
        render :nothing => true
      end
    end

    it "should redirect to root path and set an error message" do
      Lot.stub(:find).and_raise(ActiveRecord::RecordNotFound)
      get :index
      flash[:alert].should_not be_nil
      response.should redirect_to(root_path)
    end
  end

end