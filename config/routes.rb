Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :public_recipes
  root "users#index"
  resources :recipes
  
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
     resources :shoppings, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:create, :new, :destroy]
   end
  end

  # Defines the root path route ("/")

end