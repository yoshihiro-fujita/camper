Rails.application.routes.draw do
  
  devise_for :users

  root to: "home#index"  
  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  get '/post/hashtag/:name' => 'posts#hashtag'
  get '/post/hashtag' => 'posts#hashtag'
  get "users/:id" => "users#show", as: :mypage
end
