class Features
  
  @@option_regexp = %r{\s*[^@]+}
  @@feature_regexp = %r{\s*[^@]+=>(#{@@option_regexp}@@)*#{@@option_regexp}}
  @@features_regexp = %r{^(#{@@feature_regexp}@@@)*#{@@feature_regexp}\s*$}
  
  def initialize(features_string)
    @features = {}
    if ((features_string) and (!features_string.blank?))
      if features_string.match(@@features_regexp)
        features = features_string.split(%r{\s*@@@\s*})
        features.each do |feature|
          feature_name, feature_elements = feature.split(%r{\s*=>\s*})
          @features[feature_name] = feature_elements.split(%r{\s*@@\s*})
        end
      else
        @features["INVALID"] = features_string
      end
    end
  end

  def to_hash
    @features
  end
  
  def self.validation_format
    @@feature_regexp
  end
end
