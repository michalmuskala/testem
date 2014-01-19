# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :solution do
    quiz_version { create :quiz_version }
    user
  end
end
