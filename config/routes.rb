Rails.application.routes.draw do
  get 'posts/userposts' => 'posts#userposts'
  devise_for :users
  resources :posts do
    resources :comments
    end
  resources :charges
  root 'posts#index'
  
end

