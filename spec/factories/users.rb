FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end
end
