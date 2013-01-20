require 'spec_helper'

describe ApplicationHelper do
  describe "display_price" do
    it "should isolate each thousand by comma" do
      number = "1900000"
      display_price(number).should eql("1,900,000")
    end
    it "should not modify numbers that are less then one thousand" do
      number = "1"
      display_price(number).should eql("1")
    end
  end
end