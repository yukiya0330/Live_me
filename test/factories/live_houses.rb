FactoryBot.define do
  factory :live_house do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:introduction) { |n| "TEST_INTRODUCTION#{n}"}
    sequence(:postal_code) { '0123456' }
    sequence(:address) { |n| "TEST_ADDRESS#{n}"}
    LiveHouse.statuses.keys.each do |status|
      trait :"#{status}" do
        status { status }
      end
    end
  end
end
