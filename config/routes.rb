Rails.application.routes.draw do
  devise_for :users
  namespace 'api', format: 'json' do
  end
end
