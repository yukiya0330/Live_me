FactoryBot.define do
  factory :live do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:introduction) { |n| "TEST_INTRODUCTION#{n}"}
    sequence(:live_date) { 2020/10/01 }
    Live.statuses.keys.each do |status|
      trait :"#{status}" do
        status { status }
      end
    end
  end
end
