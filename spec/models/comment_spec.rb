require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:author).class_name('User') }
  it { should belong_to(:post)}
  describe 'callbacks' do
    let (:user) {create(:user)}
    let (:post) {create(:post)}
    let (:comment) {create(:comment, author:user,post:post)}
    context 'after_create' do
      it 'updates the comments counter of the associated post' do
        expect{comment}.to change {post.reload.comments_counter}.by(1)
      end
  end
  context 'after_destroy' do
    it 'updates the comments counter of the associated post' do
      comment = create(:comment, author: user, post: post)
      expect{comment.destroy}.to change {post.reload.comments_counter}.by(-1)
    end
  end

end
end
