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
  end
  def investing_in_cyprus
  end
  def strategic_location
  end
  def economic_background
  end
  def larnaca
  end
  def tourist_industry
    flash[:alert] = "Requested page is not available right now."
    redirect_to root_path
  end
  def access_and_transport
  end
  def proprty_market
  end
  def massive_investment
  end
  
end
