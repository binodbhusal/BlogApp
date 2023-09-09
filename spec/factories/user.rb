FactoryBot.define do
  factory :user do
    name { 'Tom' }
    photo { 'https://placehold.co/120x120' }
    bio { 'Teacher from Mexico' }
    posts_counter { 0 }
    email { 'user@example.com' }
    password { 'password123' }
  end
end
