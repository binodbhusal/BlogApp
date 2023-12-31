class Post < ApplicationRecord
  belongs_to :author, class_name: 'Bloguser'
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id
  after_create :update_posts_counter
  after_destroy :update_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end
end
