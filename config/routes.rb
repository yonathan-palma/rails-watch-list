Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/new'
  get 'lists/list'
  get 'lists/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # get 'lists' => 'lists#index'
  # get 'lists/new' => 'lists#new'
  # get 'lists/:id' => 'lists#show'
  # post 'lists' => 'list#create'

  get 'lists' => 'lists#index'
  resources :lists, only: [:new, :create, :show] do
    resources :bookmarks, only: [:index, :new, :create]
  end
  resources :bookmarks, only: [:destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end

# root to: "lists#index"
