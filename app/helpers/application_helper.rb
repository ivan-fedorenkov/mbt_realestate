#encoding: utf-8

module ApplicationHelper
  @@flash_classes =
    {:notice  => 'alert-info',
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
  
end
