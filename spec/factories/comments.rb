FactoryBot.define do
  factory :comment do
    association :author, factory: :user
    association :post
  end
end
