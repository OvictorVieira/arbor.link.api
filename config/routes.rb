Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        post '/create', to: 'users#create'
        post '/login', to: 'authentication#login'
      end

      namespace :partners do
        resources :entities, except: [:destroy]
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
