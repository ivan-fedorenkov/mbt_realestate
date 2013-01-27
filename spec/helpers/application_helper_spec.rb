require 'spec_helper'

describe ApplicationHelper do
  describe "display_price" do
    it "should isolate each thousand by comma and append euro sign at the beginning" do
      number = "1900000"
      display_price(number).should eql("&euro; 1,900,000")
    end
    it "should not modify numbers that are less then one thousand" do
      number = "1"
      display_price(number).should eql("&euro; 1")
    end
  end
  describe "display_boolean_field" do

    let(:object) { object = double("object") }

    it "should return true message if object field is set to true" do
      object.stub(:field).and_return(true)
      true_message = double("true message")
      display_boolean_field(object, :field, true_message).should eql(true_message)
    end
    it "should return false message if object field is set to false or nil" do
      object.stub(:field).and_return(false)
      false_message = double("false message")
      display_boolean_field(object, :field, "true message", false_message).should eql(false_message)
    end
  end
  
end