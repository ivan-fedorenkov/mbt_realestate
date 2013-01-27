MbtRealestate::Application.routes.draw do

  get "plots/index"

  root :to => 'articles#index'
  
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
    resources :investments
  end
  
  resources :articles
  resources :residential
  
end
