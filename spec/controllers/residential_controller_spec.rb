require 'spec_helper'

describe ResidentialController do

  let(:valid_residential) { FactoryGirl.build(:residential) }
  let(:residential) { valid_residential.save; valid_residential }
  let(:invalid_residential) { FactoryGirl.build(:residential, :title => "") }

  describe "find_residential filter" do
    {:show => :get, :edit => :get, :update => :put}.each do |action, method|
      it "should find the residential for #{action} action" do
        send(method, action, :id => residential.id)
        expect(assigns[:residential]).to eql(residential)
      end
      
      it "should render error and redirect to root path if residential not found" do
        send(method, action, :id => "invalid id")
        flash[:alert].should eql("Requested residential could not be found.")
        expect(response).to redirect_to(root_path)
      end
    end
  end
  
  describe "update" do
    context "no validation errors" do
      before(:each) do
        @new_residential_title = "new residential title"
        put :update, :id => residential.id, :residential => {:title => @new_residential_title}
      end
      
      it "should update a residential" do
        updated_residential = Residential.find(residential.id)
        updated_residential.title.should eql(@new_residential_title)
      end
      it "should set a success message and redirect back to the residentials page" do
        flash[:notice].should eql("Residential has been updated.")
        expect(response).to redirect_to(residential_index_path)
      end
    end
    context "validation errors" do
      it "should set an error message and render the edit residential form again" do
        put :update, :id => residential.id, :residential => {:title => invalid_residential.title}
        flash[:alert].should eql("Residential has not been updated.")
        expect(response).to render_template("edit")
      end
    end
  end

end
