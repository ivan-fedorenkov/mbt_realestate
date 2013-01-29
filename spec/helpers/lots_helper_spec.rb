require 'spec_helper'

describe LotsHelper do
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

  describe "display_square_meters" do
    it "should add a square meters html appendix at the end of a string" do
      string = "22"
      display_square_meters(string).should eql("22 m<sup>2</sup>")
    end
    it "should not add anything if string is nil or empty" do
      display_square_meters(nil).should eql("")
      display_square_meters("").should eql("")
    end
  end

  describe "display_meters_or_kilometers" do
    it "should add a meters appendix at the end of a number if its value is less then 1000" do
      display_meters_or_kilometers(100).should eql("100 m")
    end
    it "should add a kilometers appendix at the end of a number if its values is greater then 1000" do
      display_meters_or_kilometers(1000).should eql("1.0 km")
      display_meters_or_kilometers(2000).should eql("2.0 km")
      display_meters_or_kilometers(2250).should eql("2.25 km")
    end
    it "should not add anything if value is nil or not a number" do
      display_meters_or_kilometers(nil).should eql("")
      display_meters_or_kilometers("abc").should eql("abc")
    end
  end

  describe "merge_link_params" do
    describe "should replace existing hash params with params from another hash (including nesting one) and add all the new params" do
      it "adding a new key/value" do
        merge_link_params({:one => :two, :three => :four}, {:five => :six}).should eql({:one => :two, :three => :four, :five => :six})
      end
      it "replace existing value with other value for specified key" do
        merge_link_params({:one => :two},{:one => :another_two}).should eql({:one => :another_two})
      end
      it "adding a new key/value inside second nested level" do
        merge_link_params({:one => {:nested => :value}}, {:one => {:additional_nested => :value}}).should eql({
          :one => {:nested => :value, :additional_nested => :value}  
        })
      end
      it "replace existing value with other value for specified key when key at the second nested level" do
        merge_link_params({:one => {:nested => :value}}, {:one => {:nested => :replaced_value}}).should eql({
          :one => {:nested => :replaced_value}  
        })
      end
      it "replace existing value with other value for specified key when key at the third nested level" do
        merge_link_params({:one => {:nested_1 => {:nested_2 => :value}}}, {:one => {:nested_1 => {:nested_2 => :replaced_value}}}).should eql({
          :one => {:nested_1 => {:nested_2 => :replaced_value}}  
        })
      end
    end
  end

  describe "display_header" do
    it "should not display anything if :normal argument is not set" do
      display_header.should eql("")
    end
    it "should display text insde h3 > span tag" do
      header = "a test header"
      display_header(:normal => header).should eql("<h3><span>a test header</span></h3>".html_safe)
    end
    it "should not include bolded_style argument text inside span tag" do
      header_normal = "some"
      header_bolded = "text"
      display_header(:normal => header_normal, :bolded => header_bolded).should eql("<h3><span>some</span> text</h3>".html_safe)
    end
  end
end