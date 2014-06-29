Task1::Application.routes.draw do
 
  resources :articles

  resources :users
 
  root 'welcome#index'
end