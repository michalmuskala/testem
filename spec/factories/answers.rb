# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    sequence(:text) { |n| "Answer ##{n}" }
    correct { Forgery::Basic.boolean }
  end
end
