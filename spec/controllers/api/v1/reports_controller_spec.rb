require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do
  describe 'GET #by_author' do
    it 'returns http success' do
      report_params = {
        email: 'test@mail.com',
        start_date: DateTime.now - 1.month,
        finish_date: DateTime.now
      }
      post :by_author, params: report_params
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['message']).to be_eql('Report generation started')
    end
  end
end
