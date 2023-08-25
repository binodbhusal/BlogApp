require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0).only_integer }
  end
  describe 'recent_comments' do
    it 'should return 5 recent comments' do
      post = create(:post)
      create_list(:comment, 10, post: post)
      recent_comments = post.recent_comments
      expect(recent_comments.size).to eq(5)
      expect(recent_comments.first.created_at).to be > recent_comments.last.created_at
    end
  end
  describe 'update post_counter' do
    it 'updates the posts counter when a new post is created' do
      author = create(:user)
      expect do
        create(:post, author: author)
        author.reload
      end.to change(author, :posts_counter).by(1)
    end
  end
end
