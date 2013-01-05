require 'spec_helper'

describe ArticlesController do
  
  let(:valid_article) { FactoryGirl.build(:article) }
  let(:invalid_article) { FactoryGirl.build(:article, :title => "") }
  
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
      it "should set a success message upon success article creation and redirect to articles index" do
        flash[:notice].should eql("Article has been created.")
        expect(response).to redirect_to(articles_path)
      end
    end
    context "validation errors" do
      before(:each) do
        post :create, :article => {:title => invalid_article.title, :text => invalid_article.text}
      end
      it "should set an error message and render the article creation form again" do
        flash[:alert].should eql("Article has not been created.")
        expect(response).to render_template("new")
      end
    end
  end
end