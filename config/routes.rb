Rails.application.routes.draw do

  get 'users/new'
  get 'sessions/new'
  get 'treatment_records/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers do
    collection do
      get :guest
      post :guest_create
    end
  end
  resources :reservations
  resources :treatment_records
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    'customer/consent_form', to: 'customers#consent_form'
end
