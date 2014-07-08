Task1::Application.routes.draw do
 
  resources :articles

  resources :users

  resources :tags
 
  root 'welcome#index'
end