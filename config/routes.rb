Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Comments

  root to: 'lists#index'

  get :account, to: 'pages#account'

  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]

  resources :movies, only: [:show] do
    resources :reviews, only: [:new, :create, :destroy]
  end
end
