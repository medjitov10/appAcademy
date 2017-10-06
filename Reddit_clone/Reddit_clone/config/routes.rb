Rails.application.routes.draw do

  resources :subs do
    resources :posts, :shallow => true
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "subs#index"
end
