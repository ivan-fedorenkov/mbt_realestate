class Admin::ArticlesController < Admin::BaseController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Article has been created."
      redirect_to articles_path
    else
      flash[:alert] = "Article has not been created."
      render :action => "new"
    end
  end
end
