Rails.application.routes.draw do
  get 'logs/index'
  get 'logs/show'
  get 'users/index'
  get 'users/show'
  devise_for :users

  resources :users, only: [:index, :show]
  resources :logs, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end

  #welcomepage作る
  root 'logs#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
