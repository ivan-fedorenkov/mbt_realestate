require 'spec_helper'

describe Residential do
  describe "validations" do

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
 
  end
end
