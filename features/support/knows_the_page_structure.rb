#encoding: utf-8

module KnowsThePageStructure
  def get_selector(selector_human_name)
    return case selector_human_name
      when /списке предложений о жилье/
        "#lots-list"
      when /списке предложений для инвестирования/
        "#lots-list"
      when /списке предложений о продаже земли/
        "#lots-list"
      when /списке фотографий/
        "#pictures-list"
      when /в списке статей/
        "#articles-list"
      when /зоне нотификаций/
        "#notifications"
      when /панели навигации/
        "#navigation-panel"
      when /в списке регионов/
        "#locations-list"
      else 
        raise "Селектор `#{selector_human_name}` не найден в списке. Добавьте его в файл `knows_the_page_structure.rb`"
    end
  end
end

World(KnowsThePageStructure)
