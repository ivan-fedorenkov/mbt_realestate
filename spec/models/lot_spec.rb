require 'spec_helper'

describe Lot do
  describe "validation constraints" do
    [:title, :location].each do |field|
      it "#{field} should not be empty" do
        create_should_raise_record_invalid(:lot, field => nil)
      end
    end
    
    [:latitude,
     :longitude,
     :plot,
     :price_from,
     :price_to].each do |field|
      it "#{field} should be a number" do
        create_should_raise_record_invalid(:lot, field => "not a number")
      end
      it "#{field} should should be greater or equal to zero" do
        create_should_raise_record_invalid(:lot, field => -1)
      end
    end
    
    [:price_from, :price_to,:plot].each do |field|
      it "#{field} should allow any positive number" do
        create_should_not_raise_record_invalid(:lot, field => 1)
      end
    end
    
    [:latitude,:longitude].each do |field|
      it "#{field} should allow any positive floating point number" do
        create_should_not_raise_record_invalid(:lot, field => 1.0)
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
  
  describe "fields" do
    describe "price" do
      it "has a method to set a range by passing dash separeted values" do
        lot = FactoryGirl.create(:lot, :price => "100 - 20000")
        lot.price_from.should eql(100)
        lot.price_to.should eql(20000)
      end
      
      describe "price method" do
        it "should return a range values separated by dash if both `_from` and `_to` values present" do
          lot = FactoryGirl.create(:lot, :price => "100 - 20000")
          lot.price.should eql("100 - 20000")
        end
        it "should return a `_from` value if only `_from` value present or both `_from` and `_to` are empty/nil" do
          lot = FactoryGirl.create(:lot, :price => "100")
          lot.price.should eql("100")          
        end
      end
    end
  end
end
