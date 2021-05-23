Rails.application.routes.draw do
  devise_for 'users', singular: 'user', defaults: { format: :json }, path: 'api/v1/auth', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :current_user, only: :show, controller: :current_user
    end
  end
  mount Rswag::Ui::Engine => 'api_manual'
  mount Rswag::Api::Engine => 'swagger'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
