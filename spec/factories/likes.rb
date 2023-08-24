FactoryBot.define do
  factory :like do
    post {association :post}
  end
end
