basic_routes = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do
  devise_for :users,
              controllers: { 
                registrations: :registrations, 
              },
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                registration: 'signup'
              }

  namespace :api do
    post :auth, to: 'authentication#create'
    get '/auth' => 'authentication#fetch'

    resources :users, only: [:index, :destroy] do 
      resources :addresses, only: basic_routes
      resources :orders, only: [:index, :create]
    end
    
    resources :regions, only: basic_routes  do
      resources :products, only: basic_routes
    end

    devise_scope :users do
      
    end
  end

end
