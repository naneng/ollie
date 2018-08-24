Rails.application.routes.draw do


  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[ :index, :show, :edit]
  resources :requests, only: [ :index, :show, :edit, :new, :create, :update, :destroy ] do
    resources :bookings, only: :create
  end
  resources :dogs, only: [ :index, :show, :new, :create, :edit, :destroy ]
  resources :dog_requests, only: [ :index, :show, :new, :create, :edit, :destroy ]

end
