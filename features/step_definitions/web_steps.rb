module KnowsTheRoutes 
  def get_route(page_human_name)
    route = case page_human_name
      when 'articles creation' then new_article_path 
    end
    return route  
  end
end

World(KnowsTheRoutes)
  
Given /^I am on the (.*) page$/ do |page_human_name|
  visit(get_route(page_human_name))  
end
