# config/routes.rb
Rails.application.routes.draw do
  devise_for :blogusers
  root 'blogusers#index'
  resources :blogusers, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end
  resources :posts do
    resources :comments, only: [:create, :new, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  delete 'posts/:id', to: 'posts#destroy', as: :destroy_post
  namespace :api do
    namespace :v1 do
      resources :blogusers do
        resources :posts do
          get 'comments', to: 'comments#comments_for_post'
        end
      end
  
      root 'blogusers#index'
    end
  end
  

end
