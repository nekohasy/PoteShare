Rails.application.routes.draw do
  root "top#index"
  devise_for :users
  resources :rooms do
    collection do
      get 'posts'
    end
  end
  resources :reservations
end
