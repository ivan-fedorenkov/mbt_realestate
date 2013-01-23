class ActiveRecord::Base
  def self.range_fields(*fields)
    fields.each do |field|
      class_eval %Q{        
        def #{field}=(value)
          #{field}_from, #{field}_to = value.split(/\s*-\s*/)
        end
        
        def #{field}
          if(#{field}_to)
            #{field}_from + ' - ' + #{field}_to
          else
            #{field}_from
          end  
        end
      }
    end
  end
end