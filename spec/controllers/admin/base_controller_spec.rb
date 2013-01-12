require 'spec_helper'

describe Admin::BaseController do

  controller(Admin::BaseController) do
    def index
      render :nothing => true
    end
  end

  context "non authorized user" do
    it "should be redirected to sign in page" do
      get :index
      response.should redirect_to_sign_in
    end
  end
  
  context "authorized admin" do
    before(:each) do
      authenticate_admin!
    end
    
    it "should be able to access the protected resource" do
      get :index
      response.should_not redirect_to_root
    end
  end
  
end
