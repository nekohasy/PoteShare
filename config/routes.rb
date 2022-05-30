Rails.application.routes.draw do
  resources :rooms do
    collection do
      get 'posts'
    end
  end
  resources :reservations
end
