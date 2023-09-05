require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'returns the index template' do
      get users_path
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #show' do
    let(:user) { create(:user) }
    it 'returns the successful response' do
      get users_path(user)
      expect(response).to have_http_status(:success)
    end
    it 'returns the show template' do
      user = create(:user)
      get user_path(user)
      expect(response).to render_template(:show)
    end
    it 'includes placeholder text in the response body' do
      user = create(:user, name: 'Tom')
      get user_path(user)
      expect(response.body).to include(user.name.to_s)
    end
  end
end
