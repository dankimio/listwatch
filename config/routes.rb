Rails.application.routes.draw do
  root 'lists#show'

  resources :lists
  resources :movies do
    resource :rating, only: [:create, :destroy]
  end

  devise_for :users
end
