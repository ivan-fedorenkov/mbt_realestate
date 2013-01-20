require 'spec_helper'

describe ApplicationHelper do
  describe "display_price" do
    it "should insert a semicolons into the price so its output would be more readable" do
      number = "1900000"
      display_price(number).should eql("1,900,000")
      number = "1"
      display_price(number).should eql("1")
    end
  end
end