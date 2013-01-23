require 'spec_helper'

describe Lot do
  describe "validation constraints" do
    [:title, :location].each do |field|
      it "#{field} should not be empty" do
        create_should_raise_record_invalid(:residential, field => nil)
      end
    end
    
    [:latitude,
     :longitude,
     :plot,
     :price_from,
     :price_to].each do |field|
      it "#{field} should be a number" do
        create_should_raise_record_invalid(:residential, field => "not a number")
      end
      it "#{field} should should be greater or equal to zero" do
        create_should_raise_record_invalid(:residential, field => -1)
      end
    end
    
    [:price_from, :price_to,:plot].each do |field|
      it "#{field} should allow any positive number" do
        create_should_not_raise_record_invalid(:residential, field => 1)
      end
    end
    
    [:latitude,:longitude].each do |field|
      it "#{field} should allow any positive floating point number" do
        create_should_not_raise_record_invalid(:residential, field => 1.0)
      end
    end
    
  end
  
  describe "methods" do
    describe "lat_long" do
      it "should return comma separated latitude and longitude string" do
        lot = FactoryGirl.create(:lot, :latitude => 1.0, :longitude => 2.0)
        lot.lat_long.should eql("1.0,2.0")
      end
    end
  end
end
