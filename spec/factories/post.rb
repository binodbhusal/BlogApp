FactoryBot.define do
  factory :post do
    title { 'Sample post title' }
    comments_counter { 0 }
    likes_counter { 0 }
    author { association :user }
  end
end
