MbtRealestate::Application.routes.draw do

  get "plots/index"

  root :to => 'lots#index'
  
  devise_for :admins
  
  namespace :admin do
    root :to => 'base#index'
    resources :locations
    resources :articles
    resources :residential do
      resources :pictures do
        collection do
          delete :delete_all
        end
      end
    end
    resources :plots do
      resources :pictures do
        collection do
          delete :delete_all
        end
      end
    end
    resources :investments do
      resources :pictures do
        collection do
          delete :delete_all
        end
      end
    end
  end
  
  resources :articles, :only => [:show]
  resources :lots, :only => [:index, :show] do
    resources :questions, :only => [:create]
    collection do
      get :search
    end
  end

  namespace :static do
    get :property_services
    get :our_services
    get :mission
    get :strategy
    get :development_concept
  end
  
end
