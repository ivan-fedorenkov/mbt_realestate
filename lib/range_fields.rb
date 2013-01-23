class ActiveRecord::Base
  def self.range_fields(*fields)
    fields.each do |field|
      class_eval %Q{        
        def #{field}=(value)
          from, to = value.to_s.split(/\s*-\s*/)
          self.send("#{field}_from=".to_sym, from)
          self.send("#{field}_to=", to)
        end
        
        def #{field}
          if(self.send("#{field}_to"))
            self.send("#{field}_from").to_s + " - " + self.send("#{field}_to").to_s
          else
            self.send("#{field}_from").to_s
          end  
        end
      }
    end
  end
end