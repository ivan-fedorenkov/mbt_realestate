module Admin::LotsHelper

  def new_lot_button(lot_type)
    lots_properties = { 
      "Residential" => {
        :new_lot_button_text => "New Residential", 
        :new_lot_path => new_admin_residential_path,
      },
      "Investment" => {
        :new_lot_button_text => "New Investment", 
        :new_lot_path => new_admin_investment_path,
      },
      "Plot" => {
        :new_lot_button_text => "New Plot", 
        :new_lot_path => new_admin_plot_path,
      }
    }


    link_to lots_properties[lot_type][:new_lot_button_text], 
            lots_properties[lot_type][:new_lot_path], 
            :class => 'btn btn-primary'
  end

  def render_lot_form(lot)

    lots_properties = {
      "Residential" => {
        :lot_form => "admin/residential/form",
        :create_lot_path => admin_residential_index_path
      },
      "Investment" => {
        :lot_form => "admin/investments/form"
      },
      "Plot" => {
        :lot_form => "admin/plots/form"
      }
    }

    locals = {:lot => lot}
    if lot.class == Residential
      unless lot.persisted?
        locals[:url] = admin_residential_index_path
      else
        locals[:url] = admin_residential_path(lot)
      end
    end


    render :partial => lots_properties[lot.class.to_s][:lot_form], :locals => locals
  end

  def render_lot(lot)
    lots_properties = {
      "Residential" => {
        :lot_partial => "residentials/residential"
      },
      "Investment" => {
        :lot_partial => "investments/investment"
      },
      "Plot" => {
        :lot_partial => "plots/plot"
      }
    }

    render :partial => lots_properties[lot.class.to_s][:lot_partial], :object => lot
  end
end