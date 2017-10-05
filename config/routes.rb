Rails.application.routes.draw do
  post 'api/v1/user_token' => 'api/v1/user_token#create'
  root 'test#index'

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index create show] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
