require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get #index' do
    it 'returns successful response' do
      user = create(:user)
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end
    it 'returns the index template' do
      user = create(:user)
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
    it ' includes placeholder text in the response body' do
      user = create(:user)
      get user_posts_path(user)
      expect(response.body).to include('here is a list of posts of a given user')
    end
  end
  describe 'GEt #show' do
    it 'returns successful response' do
      user = create(:user)
      post = create(:post, author: user)
      get user_posts_path(user, post)
      expect(response).to have_http_status(:success)
    end
    it 'returns show template' do
      user = create(:user)
      post = create(:post, author: user)
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
    it 'include placeholder text in the response body' do
      user = create(:user)
      post = create(:post, author: user)
      get user_post_path(user, post)
      expect(response.body).to include('here is a single post')
    end
  end
end
