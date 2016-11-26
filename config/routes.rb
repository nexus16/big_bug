Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  namespace :admin do
    resources :reviews
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :admin do
    resources :users
    resources :categories
    resources :movies do 
      resources :reviews do
        member do
          get 'like', to: "reviews#like"
          get 'unlike', to: "reviews#unlike"
        end
        resources :comments
      end
    end
  end
  resources :movies do 
    resources :reviews do
      member do
        get 'like', to: "reviews#like"
        get 'unlike', to: "reviews#unlike"
      end
      resources :comments
    end
  end

  resources :categories
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root "static_pages#home"
  get '/profile', to: 'static_pages#profile'
  get '/manager_reviews', to: 'static_pages#manager_reviews'
end
