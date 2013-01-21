require 'spec_helper'

describe Admin::ResidentialController do

  before(:each) do 
    authenticate_admin!
  end
  

  describe "find_residential filter" do
    
    def stub_residential!
      @residential = double("a residential record")
      @residential.stub(:id).and_return(double("residential id"))
      @residential.stub(:update_attributes).and_return(true)
      Residential.stub(:find).and_return(@residential)
      Residential.stub(:includes).and_return(Residential)
    end
    
    controller(Admin::ResidentialController) do
      def show
        render :nothing => true
      end
    end
    
    {:show => :get, :edit => :get}.each do |action, method|
      it "should find the residential for #{action} action" do
        stub_residential!
        send(method, action, :id => @residential.id)
        expect(assigns[:residential]).to eql(@residential)
      end
      
      it "should render error and redirect to residential index path if residential not found" do
        Residential.stub(:find).and_raise(ActiveRecord::RecordNotFound)
        send(method, action, :id => "invalid id")
        flash[:alert].should eql("Requested residential could not be found.")
        expect(response).to redirect_to(admin_residential_index_path)
      end
    end
    
    {:new => :get, :create => :post, :edit => :get, :update => :put}.each do |action, method|
      it "should set a list of locations for #{action} action" do
        stub_residential!
        location_list = double("location list")
        Location.stub(:all).and_return(location_list)
        send(method, action, :id => @residential.id)
        expect(assigns[:locations]).to eql(location_list)
      end
    end
    
  end  
end