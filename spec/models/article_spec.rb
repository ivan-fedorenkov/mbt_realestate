require 'spec_helper'


describe Article do
  
  it "should not have an empty title" do
    create_should_raise_record_invalid(:article, :title => "")
  end  
  
  it "should not have an empty text" do
    create_should_raise_record_invalid(:article, :text => "")
  end
  
  describe "position attribute" do
    it "position should be a number" do
      create_should_raise_record_invalid(:article, :position => "invalid position")
    end
    
    it "position should should be greater or equal to zero" do
      create_should_raise_record_invalid(:article, :position => -1)
    end
  end
  
end