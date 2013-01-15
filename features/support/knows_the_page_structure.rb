#encoding: utf-8

module KnowsThePageStructure
  def get_selector(selector_human_name)
    return case selector_human_name
      when /списке предложений о жилье/
        "#residential-list"
      when /списке фотографий/
        "#photo-list"
      when /зоне нотификаций/
        "#notifications"
      when /панели навигации/
        "#navigation-panel"
      else 
        raise "Селектор `#{selector_human_name}` не найден в списке. Добавьте его в файл `knows_the_page_structure.rb`"
    end
  end
end

World(KnowsThePageStructure)
