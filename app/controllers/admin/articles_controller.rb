class Admin::ArticlesController < Admin::BaseController
  
  before_filter :find_article, :only => [:show, :edit, :update, :destroy]  
  
  def index
    @articles = Article.all
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Article has been created."
      redirect_to admin_article_path(@article)
    else
      flash[:alert] = "Article has not been created."
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article has been updated."
      redirect_to admin_article_path(@article)
    else
      flash[:alert] = "Article has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Article has been destroyed."
    redirect_to admin_articles_path
  end
  
private 
  def find_article
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Requested article could not be found."
      redirect_to admin_articles_path
    end
  end
  
end
