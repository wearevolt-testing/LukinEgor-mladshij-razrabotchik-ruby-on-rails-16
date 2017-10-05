require 'rails_helper'

RSpec.describe 'UserTokenController', type: :request do
  it 'return auth token' do
    user = create(:user)

    auth_params = { auth: { email: user.email, password: user.password } }
    post '/api/v1/user_token', params: auth_params
    expect(response.status).to be_eql(201)

    json = JSON.parse(response.body)
    expect(json['jwt']).to_not be_nil
  end
end
