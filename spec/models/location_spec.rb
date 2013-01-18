require 'spec_helper'

describe Location do
  describe "validations" do
    describe "name" do
      it "should not be null" do
        create_should_raise_record_invalid(:location, :name => nil)
      end
      it "should be unique" do
        name = "Location"
        create_should_not_raise_record_invalid(:location, :name => name)
        create_should_raise_record_invalid(:location, :name => name)
      end
    end
  end
end
