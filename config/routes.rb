Rails.application.routes.draw do
  post 'api/v1/user_token' => 'api/v1/user_token#create'
  root 'test#index'

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create, :show]
    end
  end
end
