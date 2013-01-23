module LotsHelper
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

  def display_square_meters(string)
    if string && !string.to_s.empty?
      return "#{string} m<sup>2</sup>".html_safe
    else
      return ""
    end
  end

  def display_meters_or_kilometers(value)
    # value is nil or not a number - return empty string
    if (!value || (value.to_i == 0 && value != 0))
      return "#{value}"
    # value is between 0 and 1000 - return meters
    elsif ((value.to_i == 0 && value == 0) || (value.to_i > 0 && value.to_i < 1000))
      return "#{value} m"
    # value is greater then 1000 - return kilometers
    else
      return "#{value.to_f / 1000.0} km"
    end
  end
  
  def display_symbolize_constant(object, field)
    object.class.send("get_#{field.to_s}_values".to_sym).send(:[], object.send(field))
  end

  def display_boolean_field(object, field, true_message = "yes", false_message = "no")
    if(object.send(field))
      true_message
    else
      false_message
    end
  end


end