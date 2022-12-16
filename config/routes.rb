# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :public_recipes
  root 'users#index'
  resources :recipes

  resources :users do
    resources :foods, only: %i[index show new create destroy]
    resources :shoppings, only: %i[index show new create destroy] do
      resources :recipe_foods, only: %i[create new destroy]
    end
  end

  # Defines the root path route ("/")
end

 # resources :shoppings, only:[:index]
end

