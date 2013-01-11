require 'spec_helper'

describe Admin::ResidentialController do

  before(:each) do 
    authenticate_admin!
  end

  describe "find_residential filter" do
    {:show => :get}.each do |action, method|
      it "should find the residential for #{action} action" do
        residential = double("a residential record")
        residential.stub(:id).and_return(double("residential id"))
        Residential.stub(:find).and_return(residential)
        Residential.stub(:includes).and_return(Residential)
        
        send(method, action, :id => residential.id)
        expect(assigns[:residential]).to eql(residential)
      end
      
      it "should render error and redirect to root path if residential not found" do
        Residential.stub(:find).and_raise(ActiveRecord::RecordNotFound)
        send(method, action, :id => "invalid id")
        flash[:alert].should eql("Requested residential could not be found.")
        expect(response).to redirect_to(admin_residential_index_path)
      end
    end
  end  
end