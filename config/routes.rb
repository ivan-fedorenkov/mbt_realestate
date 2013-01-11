MbtRealestate::Application.routes.draw do
  
  root :to => 'articles#index'
  
  devise_for :admins
  
  resources :articles
  resources :residential do
    resources :pictures
  end
  
end
