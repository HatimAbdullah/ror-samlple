Rails.application.routes.draw do
  get 'users/index'
  get 'welcome/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/users/show_image/:id', to: "users#show_image", via: 'get'
  match '/users/:id',     to: 'users#delete_user',       via: 'delete'
  match '/users/search',     to: 'users#search',       via: 'post'
  match '/users/gender',     to: 'users#bygender',       via: 'post'
  match '/excel', to: "users#excel", via: 'get'
  match '/admin_edit/:id', to: "users#edit_form", via: 'get'
  match '/admin_edit', to: "users#edit_user", via: 'put'
end
