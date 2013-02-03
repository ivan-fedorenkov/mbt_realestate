class LotSearchForm
  extend ActiveModel::Naming 
  include ActiveModel::Conversion


  attr_accessor :type, :location_id, :price_from, :price_to, :lot_internal_type
  attr_reader :types, 
    :locations, 
    :residential_lot_internal_types, 
    :investments_lot_internal_types, 
    :plots_lot_internal_types,
    :prices_from,
    :prices_to

  def initialize(args = {})

    defaults = {
      "type" => "Residential",
      "location_id" => "",
      "price_from" => "0",
      "price_to" => "",
      "lot_internal_type" => ""
    }

    defaults.merge(args).each do |key, value|
      instance_variable_set("@#{key}", value) if defaults.has_key?(key) && (!value.nil?)
    end

    @residential_lot_internal_types = [["All",""]]
    Residential.get_lot_internal_type_values.map { |key, value| @residential_lot_internal_types << [value,key] }
    @investments_lot_internal_types = [["All",""]]
    Investment.get_lot_internal_type_values.map { |key, value| @investments_lot_internal_types << [value,key] }
    @plots_lot_internal_types = [["All",""]]
    Plot.get_lot_internal_type_values.map { |key, value| @plots_lot_internal_types << [value,key] }

    @locations = [["All",""]]
    Location.all.each { |location| @locations << [location.name, location.id] }

    @prices_from = [["Min", 0],[1000],[2000],[2500],[3000],[3500],[4000],[4500],[5000]]
    @prices_to = [["Max", ""],[1000],[2000],[2500],[3000],[3500],[4000],[4500],[5000]]

    @types = [["Find a residential","Residential"],["Invest money in something","Investment"],["Buy a plot or land","Plot"]]
  end

  def persisted?
    false
  end

end