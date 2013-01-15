require 'spec_helper'

describe ArticlesController do
  
  let(:article) { FactoryGirl.create(:article) }

  describe "find_article filter" do
    {:show => :get}.each do |action, method|
      it "should find the article for #{method} method" do
        send(method, action, :id => article.id)
        expect(assigns[:article]).to eql(article)
      end
      
      it "should render error and redirect to root path if article not found" do
        send(method, action, :id => "invalid id")
        flash[:alert].should eql("Requested article could not be found.")
        expect(response).to redirect_to(root_path)
      end
    end
    
  end
   
end