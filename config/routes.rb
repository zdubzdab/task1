Task1::Application.routes.draw do
 
  resources :articles

  resources :users
  match '/email',    to: 'users#email',    via:  [:post, :get]

  resources :tags
 
  root 'welcome#index'
end