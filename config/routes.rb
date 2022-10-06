Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :feeds
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users
end
