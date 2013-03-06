module StaticLocation

  class Location
    @@locations = %w[Famagusta Limassol Larnaca Nicosia Paphos]

    def self.locations
      @@locations
    end
  end

  def self.extended(extended_by)
    extended_by.class_eval %Q{
      validates self.location_field, :inclusion => { :in => StaticLocation::Location.locations }
    }
  end

  def location_field
    :location
  end

end
