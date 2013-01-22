#encoding: utf-8

module ApplicationHelper
  @@flash_classes =
    {:notice  => 'alert-success',
     :alert   => 'alert-error'}

  def flash_class_for(key)
    @@flash_classes[key]
  end
  
  
  def display_flash_messages(flash)
    
    flash_messages = ''
    
    flash.map do |key,message|
      flash_messages +=
        content_tag(:div, :class => ['alert', flash_class_for(key)]) do 
          content_tag(:button, '×', :class => 'close', :type => 'button', :data => {:dismiss => 'alert'}) +
          message
        end
    end
    
    return flash_messages.html_safe
  end
  
  def display_price(price)
    if(price.to_i >= 1000)
      price = price.to_s
      price_length = price.length
      current_position = price_length - 3
      begin
        if (((price_length - current_position) % 3) == 0)
          price = price.insert(current_position, ",")
        end 
        current_position -= 1
      end while current_position > 0
    end
    
    return "&euro; #{price}".html_safe
  end
  
  def display_symbolize_constant(object, field)
    object.class.send("get_#{field.to_s}_values".to_sym).send(:[], object.send(field))
  end
  
  
  def static_google_map_tag(args)
    map = "<img src='@link?@api_key@params@markers'>"
    map.gsub!("@link", "http://maps.googleapis.com/maps/api/staticmap")
    map.gsub!("@api_key", Rails.configuration.google_maps_api_key)
    
    params = ""
    params += "&center=#{args[:center]}" if args[:center]
    params += "&size=#{args[:size]}" if args[:size]
    params += "&zoom=#{args[:zoom]}" if args[:zoom]
    params += "&sensor=#{args[:sensor] or false}"
    
    map.gsub!("@params", params)
   
    
    markers_args = args[:markers]
    if markers_args
      markers = "&markers=#{markers_args[:style]}|#{markers_args[:locations]}"
      map.gsub!("@markers", markers)
    else
      map.gsub!("@markers","")
    end
    
    return map.html_safe
  end
  
  def resource_name
    :admin
  end
 
  def resource
    @resource ||= Admin.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end
  
end
