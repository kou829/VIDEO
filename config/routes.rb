Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'videos/index'
  root to: 'videos#index'

  resources :videos do
    resources :comments, only: :create
  end

  get '/videos/genre/:id', to: "videos#genre"

  post '/videos/guest_sign_in', to: 'videos#new_guest'

end
