Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :feeds
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
