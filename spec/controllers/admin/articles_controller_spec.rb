require 'spec_helper'

describe Admin::ArticlesController do
  
  let(:valid_article) { FactoryGirl.build(:article) }
  let(:article) { valid_article.save!; valid_article }
  let(:invalid_article) { FactoryGirl.build(:article, :title => "") }
  
  before(:each) do 
    authenticate_admin!
  end
  
  describe "find_article filter" do
    {:show => :get, :edit => :get, :update => :put}.each do |action, method|
      it "should find the article for #{method} method" do
        send(method, action, :id => article.id)
        expect(assigns[:article]).to eql(article)
      end
      
      it "should render error and redirect to articles index if article not found" do
        send(method, action, :id => "invalid id")
        flash[:alert].should eql("Requested article could not be found.")
        expect(response).to redirect_to(admin_articles_path)
      end
    end
  end
  
  describe "index" do
    it "should set the list of articles variable" do
      articles = double("An articles array")
      Article.stub(:all).and_return(articles)
      get :index
      expect(assigns[:articles]).to eql(articles)
    end
  end
  
  describe "create" do
    context "no validation errors" do
      before(:each) do
        post :create, :article => {:title => valid_article.title, :text => valid_article.text}
      end
      it "should create a new article" do
        last_article = Article.last
        last_article.title.should eql(valid_article.title)
        last_article.text.should eql(valid_article.text)
      end
      it "should set a success message and redirect to articles index" do
        flash[:notice].should eql("Article has been created.")
        expect(response).to redirect_to(admin_article_path(Article.last))
      end
    end
    context "validation errors" do
      it "should set an error message and render the article creation form again" do
        post :create, :article => {:title => invalid_article.title, :text => invalid_article.text}
        flash[:alert].should eql("Article has not been created.")
        expect(response).to render_template("new")
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
        expect(response).to redirect_to(admin_article_path(article))
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
