Rails.application.routes.draw do
  root 'lists#show'

  resources :lists

  devise_for :users
end
