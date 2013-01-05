require 'spec_helper'

describe ApplicationController do
  
  controller do
    def index
      render :nothing => true
    end
  end
  
  it "should set a list of articles so their links could be rendered inside navigation bar" do
    get :index
    expect(assigns[:articles_for_navbar]).to be_true
  end
  
end