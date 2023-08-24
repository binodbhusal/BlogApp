require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end
  describe 'callbacks' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let(:like) { create(:like, author: user, post: post) }
    context 'after_create' do
      it 'updates the likes counter of the associated post' do
        expect { like }.to change { post.reload.likes_counter }.by(1)
      end
    end
    context 'after_destroy' do
      it 'updates the likes counter of the associated post' do
        like = create(:like, author: user, post: post)
        expect { like.destroy }.to change { post.reload.likes_counter }.by(-1)
      end
    end
  end
end
