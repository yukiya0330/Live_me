FactoryBot.define do
  factory :report do
    sequence(:comment) { |n| "TEST_COMMENT#{n}"}
  end
end
