Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    root 'home#index'

    get '/appointments/search', to: 'appointments#search', as: 'search_appointments'
    get '/dentists/search', to: 'dentists#search', as: 'search_dentists'
    get '/patients/search', to: 'patients#search', as: 'search_patients'

    resources :appointments
    resources :dentists
    resources :patients
  end
end
