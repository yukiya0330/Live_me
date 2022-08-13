FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "TEST_NAME#{n}"}
  end
end
