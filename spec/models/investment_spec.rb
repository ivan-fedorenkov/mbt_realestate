require 'spec_helper'

describe Investment do
  describe "validations" do

    describe "lot internal type" do
      it "should not allow type that is not in predefined list" do
        create_should_raise_record_invalid(:investment, :lot_internal_type => "invalid type")
      end
      [:detached_house, :semi_detached, :town_house,:apartment].each do |type|
        it "should allow type: #{type.to_s}" do
          create_should_not_raise_record_invalid(:investment, :lot_internal_type => type)
        end
      end
    end
 
  end
end