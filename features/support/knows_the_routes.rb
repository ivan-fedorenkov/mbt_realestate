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
        lot_path(Residential.where(:title => $2).first)
      when /странице редактирования предложений о жилье/
        residential_index_path
      when /странице добавления предложения о жилье/
        new_admin_residential_path
      when /страниц(е|у) редактирования предложения о жилье "(.*?)"/
        edit_admin_residential_path(Residential.where(:title => $2).first)
      when /странице редактирования этого предложения о жилье/
        edit_admin_residential_path(residential)
        
      when /странице редактирования фотографий предложения о жилье "(.*?)"/
        admin_residential_pictures_path(Residential.where(:title => $1).first)
      when /страниц(е|у) редактирования фотографий этого предложения о жилье/
        admin_residential_pictures_path(residential)
  
      when /странице добавления нового предложения о продаже земли/
        new_admin_plot_path
      when /страниц(е|у) предложения о (продаже )?земл(е|и) "(.*?)" панели администратора/
        admin_plot_path(Plot.where(:title => $4).first)
      when /странице этого предложения о земле панели администратора/
        admin_plot_path(plot)
      when /странице редактирования этого предложения о земле/
        edit_admin_plot_path(plot)
        
      when /страниц(е|у) редактирования фотографий этого предложения о земле/
        admin_plot_pictures_path(plot)
      when /странице редактирования фотографий предложения о земле "(.*?)"/
        admin_plot_pictures_path(Plot.where(:title => $1).first)
      
      when /странице добавления нового предложения для инвестирования/
        new_admin_investment_path
      when /страниц(е|у) предложения для инвестирования "(.*?)" панели администратора/
        admin_investment_path(Investment.where(:title => $2).first)
      when /странице этого предложения для инвестирования панели администратора/
        admin_investment_path(investment)
      when /странице редактирования предложения для инвестирования "(.*?)"/
        edit_admin_investment_path(Investment.where(:title => $1).first)
      when /странице редактирования этого предложения для инвестирования/
        edit_admin_investment_path(investment)

      when /страниц(е|у) редактирования фотографий этого предложения для инвестирования/
        admin_investment_pictures_path(investment)
      when /странице редактирования фотографий предложения для инвестирования "(.*?)"/
        admin_investment_pictures_path(Investment.where(:title => $1).first)

      when /странице результатов поиска лотов/
        search_lots_path
      when /странице этого лота/
        lot_path(lot)


      when /странице редактирования регионов/
        admin_locations_path
      when /странице редактирования этого региона/
        edit_admin_location_path(location)
        
      when /странице входа в учётную запись/
        new_admin_session_path

      else
        raise "Путь `#{page_human_name}` не найден. Необходимо добавить путь в файл `knows_the_routes.rb`"        
    end
  end
end

World(KnowsTheRoutes)
