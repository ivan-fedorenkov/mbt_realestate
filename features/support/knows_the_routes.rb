#encoding: utf-8

module KnowsTheRoutes
  def get_route(page_human_name)
    return case page_human_name
      when /странице добавления новых статей/
        new_article_path
    end
  end
end

World(KnowsTheRoutes)