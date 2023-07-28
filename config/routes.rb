Rails.application.routes.draw do
  resources :appointments do
    collection do
      get 'search'
    end
  end

  resources :dentists do
    collection do
      get 'search'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/agendar_consulta', to: 'appointments#new', as: 'agendar_consulta'
  root 'home#index'
end
