FactoryBot.define do
  factory :artist do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:introduction) { |n| "TEST_INTRODUCTION#{n}"}
    Artist.statuses.keys.each do |status|
      trait :"#{status}" do
        status { status }
      end
    end
  end
end
