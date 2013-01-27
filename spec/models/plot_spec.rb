require 'spec_helper'

describe Plot do
  describe "validations" do

    describe "lot internal type" do
      it "should not allow type that is not in predefined list" do
        create_should_raise_record_invalid(:plot, :lot_internal_type => "invalid type")
      end
      [:plot, :land].each do |type|
        it "should allow type: #{type.to_s}" do
          create_should_not_raise_record_invalid(:plot, :lot_internal_type => type)
        end
      end
    end
 
  end
end