class StaticController < ApplicationController
  def property_services
  end
  def our_services
  end
  def mission
  end
  def strategy
  end
  def development_concept
  end

  def permanent_residence
  end
  def required_documents
  end
  def why_cyprus
  end
  def naturalisation
  end

  def about_cyprus
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def investing_in_cyprus
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def strategic_location
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def economic_background
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def larnaca
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def tourist_industry
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def access_and_transport
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def proprty_market
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def massive_investment
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  
end
