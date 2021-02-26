Rails.application.routes.draw do

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

  resource :treatment_records
  get 'customer/consent_form', to: 'customers#consent_form'
end
