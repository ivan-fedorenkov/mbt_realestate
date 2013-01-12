require 'spec_helper'

describe ArticlesController do
  
  let(:valid_article) { FactoryGirl.build(:article) }
  let(:article) { valid_article.save!; valid_article }
  let(:invalid_article) { FactoryGirl.build(:article, :title => "") }

  describe "find_article filter" do
    {:show => :get,:edit => :get, :update => :put}.each do |action, method|
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

   
  describe "update" do
    context "no validation errors" do
      before(:each) do
        @new_article_title = "new article title"
        @new_article_text = "new article text"
        put :update, :id => article.id, :article => {:title => @new_article_title, :text => @new_article_text}
      end
      
      it "should update an article" do
        updated_article = Article.find(article.id)
        updated_article.title.should eql(@new_article_title)
        updated_article.text.should eql(@new_article_text)
      end
      it "should set a success message and redirect back to the article page" do
        flash[:notice].should eql("Article has been updated.")
        expect(response).to redirect_to(article_path(article))
      end
    end
    context "validation errors" do
      it "should set an error message and render the edit article form again" do
        put :update, :id => article.id, :article => {:title => invalid_article.title, :text => invalid_article.text}
        flash[:alert].should eql("Article has not been updated.")
        expect(response).to render_template("edit")
      end
    end
  end 
   
end