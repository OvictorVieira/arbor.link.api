Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :entities
      get 'entities/index'
      get 'entities/show'
      get 'entities/new'
      get 'entities/edit'
      get 'entities/create'
      get 'entities/update'
      get 'entities/destroy'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
