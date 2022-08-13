FactoryBot.define do
  factory :customer do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:nickname) { |n| "TEST_NICKNAME#{n}"}
    sequence(:email) { 'test@test' }
    sequence(:encrypted_password) { 'aaaaaa' }
    sequence(:is_deleted) { false }
  end
end
