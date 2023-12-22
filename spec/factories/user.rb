FactoryBot.define do
  factory :bloguser do
    name { 'Tom' }
    photo { 'https://placehold.co/120x120' }
    bio { 'Teacher from Mexico' }
    posts_counter { 0 }
  end
end
