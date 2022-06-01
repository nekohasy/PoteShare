Rails.application.routes.draw do
  root "top#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :users do
    collection do
      get 'account'
      get 'profile'
      patch 'profile'
    end
  end

  resources :rooms do
    collection do
      get 'posts'
      get 'search'
    end
  end
  
  resources :users
  resources :rooms
  resources :reservations
end
