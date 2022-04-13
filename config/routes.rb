Rails.application.routes.draw do
  root to: "books#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  resources :books

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
