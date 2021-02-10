Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :rooms, only: :index do
        member do
          post :check_in
          post :check_out
        end
      end
      resources :customers, only: [:index, :create, :update]
    end
  end
end
