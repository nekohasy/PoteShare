Rails.application.routes.draw do
  root "top#index"
  devise_for :users

  resources :users do
    collection do
      get 'account'
    end
  end

  resources :rooms do
    collection do
      get 'posts'
    end
  end
  resources :reservations
end
