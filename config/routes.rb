Rails.application.routes.draw do
  get 'emails/unsubscribe'
  resources :projects do
    resources :tasks
  end    


  resources :booking_types
  resources :bookings, except: [:index, :new]
  # root to: 'static_pages#index'
  
  get   'about', to: 'static_pages#about'
  get   'contact', to: 'static_pages#contact'
  get   'privacy', to: 'static_pages#privacy'
  devise_for :users

  authenticated :user do
    root to: "home#dashboard", as: :authenticated_root
  end  

  post "payment-intent", to: "bookings#intent"
  get ":booking_link", to: "users#show", as: :user

  scope '/:booking_link', as: :user do
    resources :bookings, only: [:index, :new]
  end

  # resources :webhooks, only: :create

  root to: "home#index"  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
