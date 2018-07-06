Rails.application.routes.draw do
  devise_for :users
  root 'artifacts#home'

  get "/artifacts/gallery", to: "artifacts#gallery"
  get "/artifacts/home", to: "artifacts#home"
  post "/artifacts", to: "artifacts#modal"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artifacts
end
