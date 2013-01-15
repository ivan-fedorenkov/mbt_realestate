class ArticlesController < ApplicationController
  
  before_filter :find_article, :only => [:show]
  
  def index
    @articles = Article.all
  end
  
  def show
  end
  
private 
  def find_article
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested article could not be found."
      redirect_to root_path
    end
  end
end
