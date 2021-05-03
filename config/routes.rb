Rails.application.routes.draw do
  devise_for :users,
  contollers: { registrations: :registrations, sessions: :sessions }

  namespace 'api', format: 'json' do
  end
end
