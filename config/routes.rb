Rails.application.routes.draw do
  root to: "books#index"
  resources :users, only: %i[show]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
