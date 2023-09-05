FactoryBot.define do
  factory :post do
    association :author, factory: :user
    title { 'Sample post title' }
    text { 'Sample post text' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
