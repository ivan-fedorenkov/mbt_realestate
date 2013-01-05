class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_articles_for_navbar
  
  
private
  def get_articles_for_navbar
    @articles_for_navbar = Article.all
  end
end
