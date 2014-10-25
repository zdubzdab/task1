Task1::Application.routes.draw do
 
  devise_for :users
  get "persons/profile"
  resources :articles
    match '/articles',    to: 'articles#update',    via:  [:patch]

  resources :users
    match '/email',    to: 'users#email',    via:  [:post, :get]

  resources :tags

  get 'persons/profile', as: 'user_root'
 
  root 'welcome#index'
end