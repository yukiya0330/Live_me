FactoryBot.define do
  factory :comment do
    sequence(:comment) { |n| "TEST_COMMENT#{n}"}
  end
end
