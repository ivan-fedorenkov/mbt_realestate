class ResidentialSearchForm

  def initialize
    @lot_internal_types = [["All",""]]
    Residential.get_lot_internal_type_values.map { |key, value| @lot_internal_types << [value,key] }

    @locations = [["All",""]]
    Location.all.each { |location| @locations << [location.name, location.id] }
  end


  attr_reader :lot_internal_types, :locations
end