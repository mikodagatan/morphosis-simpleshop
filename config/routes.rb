basic_routes = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: :registrations, sessions: :sessions }

  resources :regions, only: basic_routes  do
    resources :products, only: basic_routes
  end
end
