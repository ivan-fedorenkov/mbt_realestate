module LotsHelper

  def display_price(price)
    price = price.to_s.gsub(/\d+/) do |subprice|
      if(subprice.to_i >= 1000)
        subprice = subprice.to_s
        price_length = subprice.length
        current_position = price_length - 3
        begin
          if (((price_length - current_position) % 3) == 0)
            subprice = subprice.insert(current_position, ",")
          end 
          current_position -= 1
        end while current_position > 0
      end
      subprice
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

  def merge_link_params(params, additional_params)
    # Go throught the additional params hash
    additional_params.map do |key, value|
      # If original params hash has a current key
      if params.has_key? key
        # If original params hash value for current key is a hash
        # and we want to add a new hash inside this hash...
        if params[key].is_a?(Hash) and value.is_a?(Hash)
          merge_link_params(params[key], value)
        # If original params hash value for current key is not a hash
        # or we are going to replace this hash with value
        else
          params.merge!({key => value})
        end
      # If original params hash doesn't contain such key, just add it
      else
        params.merge!({key => value})
      end
    end

    return params
  end

  def display_header(args = {})
    header = ""
    if args[:normal]
      header += "<h3><span>#{args[:normal]}</span>"
      header += " #{args[:bolded]}" if args[:bolded]
      header += "</h3>"
    end

    return header.html_safe
  end

end