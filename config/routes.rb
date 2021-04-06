Rails.application.routes.draw do

  get 'users/new'
  get 'sessions/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers do
    collection do
      get :guest
      post :guest_create
      get :desc_index
    end
  end
  resources :reservations
  get   'reservations/new/:reservation_date', to: 'reservations#new_timeselect', as: :reservations_new_timeselect
  get   'reservations/edit/:id', to: 'reservations#edit_timeselect', as: :reservations_edit_timeselect

  resources :treatment_records
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    'customer/consent_form', to: 'customers#consent_form'
  get    'treatment_record/empty_page', to: 'treatment_records#empty_page'



end
