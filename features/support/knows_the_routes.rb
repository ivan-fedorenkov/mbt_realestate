#encoding: utf-8

module KnowsTheRoutes
  def get_route(page_human_name)
    return case page_human_name
      when /главной странице/
        root_path
      when /странице добавления новых статей/
        new_article_path
        
      when /страницу предложения "(.*?)"/
	      residential_path(Residential.where(:title => $1).first)       
      when /странице редактирования предложений о жилье/
        residential_index_path
      when /странице добавления предложения/
        new_residential_path
      when /странице редактирования предложения "(.*?)"/
        edit_residential_path(Residential.where(:title => $1).first)
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
