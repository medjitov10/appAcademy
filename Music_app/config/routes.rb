Rails.application.routes.draw do
  resources :bands
  resources :albums, only: [:new,:create,:destroy,:show,:update,:edit]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'bands#index'
end
