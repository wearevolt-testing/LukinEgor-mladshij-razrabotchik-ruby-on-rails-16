Rails.application.routes.draw do
  post 'api/v1/user_token' => 'api/v1/user_token#create'
  root 'test#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
