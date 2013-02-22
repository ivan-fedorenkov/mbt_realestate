require 'spec_helper'

describe LotsController do
  describe "index" do
    before do
      @res100 = FactoryGirl.create(:residential, :price => 100)
      @res200 = FactoryGirl.create(:residential, :price => 200)
      @res300 = FactoryGirl.create(:residential, :price => 300)

      @investment = FactoryGirl.create(:investment)
      @plot = FactoryGirl.create(:plot)
    end

    it "should set a list of residentials, sorted by price" do
      get :index
      assigns(:lots).should =~ [@res100, @res200, @res300]
    end
  end

end