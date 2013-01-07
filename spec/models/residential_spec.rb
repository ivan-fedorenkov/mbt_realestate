require 'spec_helper'

describe Residential do
  describe "validations" do
    it "title should not be empty" do
      create_should_raise_record_invalid(:residential, :title => "")
    end
    
    [:price,:levels,:bedrooms,:covered_area,:baths,:plot].each do |field|
      it "#{field} should be a number" do
        create_should_raise_record_invalid(:residential, field => "not a number")
      end
      it "#{field} should should be greater or equal to zero" do
        create_should_raise_record_invalid(:residential, field => -1)
      end
    end
    
    it "type should be one of predefined constant value" do
      create_should_raise_record_invalid(:residential, :residential_type => "invalid type")
    end
    
  end
end
