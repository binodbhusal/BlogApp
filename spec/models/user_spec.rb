require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0).only_integer }
end
describe '#recent posts' do
it 'should returns the 3 most posts' do
  user = create(:user)
  create_list(:post,5,author: user, comments_counter:0, likes_counter:0)
  recent_posts = user.recent_posts
  expect(recent_posts.size).to eq(3)
  expect(recent_posts.first.created_at).to be > recent_posts.last.created_at
end
end

end
