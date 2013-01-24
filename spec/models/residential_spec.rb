require 'spec_helper'

describe Residential do
  describe "validations" do

    [:levels,
     :bedrooms,
     :baths,
     :distance_to_sea,
     :parking,
     :covered_area,
     :opened_veranda].each do |field|
      it "#{field} should be a number" do
        create_should_raise_record_invalid(:residential, field => "not a number")
      end
      it "#{field} should should be greater or equal to zero" do
        create_should_raise_record_invalid(:residential, field => -1)
      end
    end
    
    [:levels,:bedrooms,:baths,:distance_to_sea,:parking].each do |field|
      it "#{field} should allow any positive number" do
        create_should_not_raise_record_invalid(:residential, field => 1)
      end
    end
    
    [:covered_area,:opened_veranda].each do |field|
      it "#{field} should allow any positive floating point number" do
        create_should_not_raise_record_invalid(:residential, field => 1.0)
      end
    end
    
    describe "residential type" do
      it "should not allow type that is not in predefined list" do
        create_should_raise_record_invalid(:residential, :residential_type => "invalid type")
      end
      [:detached_house, :semi_detached, :town_house,:apartment].each do |type|
        it "should allow type: #{type.to_s}" do
          create_should_not_raise_record_invalid(:residential, :residential_type => type)
        end
      end
    end
  
    describe "additional features" do
      it "should not allow string that is not in predefined format" do
        create_should_raise_record_invalid(:residential, :additional_features => "invalid features string")
      end
      it "should allow string in predefined format" do
        create_should_not_raise_record_invalid(
          :residential, 
          :additional_features => "feature#1: option1; feature2: option2, option3")
      end
    end
    
    
  end
end
