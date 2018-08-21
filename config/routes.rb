Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :show ]
  resources :dogs, only: [ :index, :show, :new, :create, :edit, :destroy ] do
    resources :requests, only: [ :show, :edit, :new, :create, :destroy ]

  end
end
