basic_routes = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do
  devise_for :users,
              controllers: { 
                registrations: :registrations, 
                sessions: :sessions 
              },
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                registration: 'signup'
              }

  resources :regions, only: basic_routes  do
    resources :products, only: basic_routes
  end
end
