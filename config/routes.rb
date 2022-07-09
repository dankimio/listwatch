Rails.application.routes.draw do
  root 'lists#index'

  resources :lists
  resources :movies do
    resource :rating, only: %i[create destroy]
  end

  devise_for :users
end
