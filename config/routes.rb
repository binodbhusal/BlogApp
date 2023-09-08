# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end
  resources :posts do
    resources :comments, only: [:create, :new, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  delete 'posts/:id', to: 'posts#destroy', as: :destroy_post
end
