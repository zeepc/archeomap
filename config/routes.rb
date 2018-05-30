Rails.application.routes.draw do
  devise_for :users

  root 'artifacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artifacts
end
