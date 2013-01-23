require 'spec_helper'

describe Lot do
  describe "validation constraints" do
    [:title, :location].each do |field|
      it "#{field} should not be empty" do
        create_should_raise_record_invalid(:lot, field => nil)
      end
    end

    [:private_pool, :communal_pool, :title_deed_ready, :include_vat].each do |field|
      it "#{field} should raise exception if value is not true, false or nil" do
        lot = FactoryGirl.create(:lot, field => "invalid value")
        lot.send("#{field}").should be_false
      end
      it "#{field} should not raise exception if value is true, false or nil" do
        lot = FactoryGirl.create(:lot, field => true)
        lot.send("#{field}").should be_true
        lot = FactoryGirl.create(:lot, field => false)
        lot.send("#{field}").should be_false
        lot = FactoryGirl.create(:lot, field => nil)
        lot.send("#{field}").should be_nil
      end
    end
    
    [:plot_from,
     :plot_to,
     :price_from,
     :price_to,
     :levels_from,
     :levels_to,
     :bedrooms_from,
     :bedrooms_to,
     :baths_from,
     :baths_to,
     :distance_to_sea,
     :parking_from,
     :parking_to,
     :covered_area_from,
     :covered_area_to,
     :opened_veranda_from,
     :opened_veranda_to].each do |field|
      it "#{field} should be a number" do
        create_should_raise_record_invalid(:lot, field => "not a number")
      end
      it "#{field} should should be greater or equal to zero" do
        create_should_raise_record_invalid(:lot, field => -1)
      end
    end
    
    [:price_from, 
     :price_to,
     :plot_from,
     :plot_to,
     :levels_from,
     :levels_to,
     :bedrooms_from,
     :bedrooms_to,
     :baths_from,
     :baths_to,
     :parking_from,
     :parking_to,
     :distance_to_sea].each do |field|
      it "#{field} should allow any positive number" do
        create_should_not_raise_record_invalid(:lot, field => 1)
      end
    end
    
    [:latitude,:longitude,
     :covered_area_from, :covered_area_to,
     :opened_veranda_from, :opened_veranda_to].each do |field|
      it "#{field} should allow any positive floating point number" do
        create_should_not_raise_record_invalid(:lot, field => 1.0)
      end
    end

    [:latitude,:longitude].each do |field|
      it "#{field} should be a number" do
        create_should_raise_record_invalid(:lot, field => "not a number")
      end
      it "#{field} should allow any negative floating point number" do
        create_should_not_raise_record_invalid(:lot, field => -1.0)
      end
      it "#{field} should allow zero value" do
        create_should_not_raise_record_invalid(:lot, field => 0)
      end
    end
    
    describe "additional features" do
      it "should not allow string that is not in predefined format" do
        create_should_raise_record_invalid(:lot, :additional_features => "invalid features string")
      end
      it "should allow string in predefined format" do
        create_should_not_raise_record_invalid(
          :lot, 
          :additional_features => "feature#1: option1; feature2: option2, option3")
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
    describe "range fields" do
      [:price, :plot, :bedrooms, :baths, :covered_area, :opened_veranda, :levels].each do |field|
        describe "#{field}" do
          it "has a method to set a range by passing dash separeted values" do
            lot = FactoryGirl.create(:lot, field => "100 - 20000")
            lot.send("#{field}_from").should eql(100)
            lot.send("#{field}_to").should eql(20000)
          end
          
          describe "#{field} method" do
            it "should return a range values separated by dash if both `_from` and `_to` values present" do
              lot = FactoryGirl.create(:lot, field => "100 - 20000")
              lot.send("#{field}").should eql("100 - 20000")
            end
            it "should return a `_from` value if only `_from` value present or both `_from` and `_to` are empty/nil" do
              lot = FactoryGirl.create(:lot, field => "100")
              lot.send("#{field}").should eql("100")          
            end
          end 
        end
      end
    end
  end
end
