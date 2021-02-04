Rails.application.routes.draw do
  get 'reservation_lists/index'
  get 'rails/g'
  get 'rails/ReservationList'
  get 'guest_reservations/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers
  resources :guest_reservations
  get 'customer/consent_form', to: 'customers#consent_form'
  get 'guest_reservations/new', to: 'guest_reservations#new'
end
