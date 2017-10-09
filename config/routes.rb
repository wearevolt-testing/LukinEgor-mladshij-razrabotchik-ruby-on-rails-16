Rails.application.routes.draw do
  post 'api/v1/user_token' => 'api/v1/user_token#create'
  root 'web/dashboard#index'
  get 'signin' => 'web/dashboard#index'
  get 'signup' => 'web/dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index show create] do
        resources :comments, only: %i[index create]
      end

      resources :users, only: %i[show create update] do
        collection do
          get :auth
        end
      end

      post 'reports/by_author'
    end
  end
end
