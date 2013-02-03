class LotSearchForm
  extend ActiveModel::Naming 
  include ActiveModel::Conversion


  attr_accessor :type, :location_id, :price_from, :price_to
  attr_reader :locations, :residential_lot_internal_types, :investments_lot_internal_types, :plots_lot_internal_types

  def initialize(params = {:type => "Residential", :location_id => "", :price_from => "0", :price_to => ""})
    @type, @location_id, @price_from, @price_to = params[:type], params[:location_id], params[:price_from], params[:price_to]

    @residential_lot_internal_types = [["All",""]]
    Residential.get_lot_internal_type_values.map { |key, value| @residential_lot_internal_types << [value,key] }
    @investments_lot_internal_types = [["All",""]]
    Investment.get_lot_internal_type_values.map { |key, value| @investments_lot_internal_types << [value,key] }
    @plots_lot_internal_types = [["All",""]]
    Plot.get_lot_internal_type_values.map { |key, value| @plots_lot_internal_types << [value,key] }

    @locations = [["All",""]]
    Location.all.each { |location| @locations << [location.name, location.id] }
  end

  def persisted?
    false
  end

end