#encoding: utf-8

module KnowsTheRoutes
  def get_route(page_human_name)
    
    return case page_human_name
      when /главн(ой|ую) страниц(е|у) панели администратора/
        admin_root_path
      when /главной странице/
        root_path
      when /страниц(е|у) добавления( новых)? статей/
        new_admin_article_path
      when /страниц(е|у) редактирования статей/
        admin_articles_path
      when /страниц(е|у) редактирования этой статьи/
        edit_admin_article_path(article)
      when /страниц(е|у|) статьи "(.*?)" панели администратора/
        admin_article_path(Article.where(:title => $2).first)
      when /странице просмотра изменяемой статьи/
        admin_article_path(article)
      when /страниц(е|у) статьи "(.*?)"/
        article_path(Article.where(:title => $2).first)
      
      when /странице этого предложения о жилье панели администратора/
        admin_residential_path(residential)
      when /страниц(е|у) предложения о жилье "(.*?)" панели администратора/
	      admin_residential_path(Residential.where(:title => $2).first)
      when /страниц(е|у) предложения о жилье "(.*?)"/
        residential_path(Residential.where(:title => $2).first)
      when /странице редактирования предложений о жилье/
        residential_index_path
      when /странице добавления предложения о жилье/
        new_admin_residential_path
      when /странице редактирования предложения о жилье "(.*?)"/
        edit_admin_residential_path(Residential.where(:title => $1).first)
      when /странице редактирования этого предложения о жилье/
        edit_admin_residential_path(residential)
      when /странице редактирования фотографий предложения о жилье "(.*?)"/
        residential_pictures_path(Residential.where(:title => $1).first)
        
      when /странице входа в учётную запись/
        new_admin_session_path
              
      else
        raise "Путь `#{page_human_name}` не найден. Необходимо добавить путь в файл `knows_the_routes.rb`"        
    end
  end
end

World(KnowsTheRoutes)
