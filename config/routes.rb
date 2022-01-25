Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "login", to: "authentication#login"
  resources :posts do
    resources :comments do
    end
  end
end
