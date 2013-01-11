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
    price = price.to_s
    price_length = price.length
    current_position = price_length - 3
    begin
      if (((price_length - current_position) % 3) == 0)
        price = price.insert(current_position, ",")
      end 
      current_position -= 1
    end while current_position > 0 
    return price
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
