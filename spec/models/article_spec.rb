require 'spec_helper'


describe Article do
  
  it "should not have an empty title" do
    create_should_raise_record_invalid(:article, :title => "")
  end  
  
  it "should not have an empty text" do
    create_should_raise_record_invalid(:article, :text => "")
  end
  
end