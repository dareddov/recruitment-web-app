FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:password) { 'Secret99' }
    gender { [:male, :female].sample }
    age { rand(100) }

    trait :with_admin_role do
      role :admin
    end

    trait :with_user_role do
      role :user
    end
  end
end
