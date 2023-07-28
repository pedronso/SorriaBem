Rails.application.routes.draw do
  resources :appointments
  resources :dentists do
    collection do
      get 'search'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: 'rails/welcome#index'
  root 'home#index'
end
