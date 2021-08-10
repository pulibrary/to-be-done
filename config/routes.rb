# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users,
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      sign_up: "signup"
    }

  authenticated :user do
    root to: "items#index", as: :authenticated_root
  end

  unauthenticated :user do
    root to: "home#index"
  end

  resources :users, only: [:show] do
    resources :items
    resources :books, controller: "items", type: "Book"
  end
end
