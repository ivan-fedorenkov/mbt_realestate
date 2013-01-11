MbtRealestate::Application.routes.draw do

  root :to => 'articles#index'
  
  devise_for :admins
  
  namespace :admin do
    root :to => 'base#index'
    resources :articles
    resources :residential
  end
  
  resources :articles
  resources :residential do
    resources :pictures
  end
  
end
