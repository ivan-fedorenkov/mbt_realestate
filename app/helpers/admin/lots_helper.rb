module Admin::LotsHelper

  def new_lot_button(lot_type)
    path = send("new_admin_#{lot_type.downcase}_path")
    title = "New #{lot_type}"

    link_to title, path, :class => 'btn btn-primary'
  end

  def render_lot_form(lot)
    lot_form_partial = "admin/#{lot.class.to_s.downcase.pluralize}/form"

    render :partial => lot_form_partial, :locals => {:lot => lot}
  end

  def render_lot(lot)
    lot_class_name = lot.class.to_s.downcase
    lot_partial = "#{lot_class_name.pluralize}/#{lot_class_name}"

    render :partial => lot_partial, :object => lot
  end  

end