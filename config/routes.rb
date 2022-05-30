Rails.application.routes.draw do
  devise_for :users
  resources :rooms do
    collection do
      get 'posts'
    end
  end
  resources :reservations
end
