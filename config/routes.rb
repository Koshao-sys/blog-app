Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
