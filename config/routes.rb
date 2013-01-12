MbtRealestate::Application.routes.draw do

  root :to => 'articles#index'
  
  devise_for :admins
  
  namespace :admin do
    resources :articles
  end
  
  resources :articles
  resources :residential do
    resources :pictures
  end
  
end
