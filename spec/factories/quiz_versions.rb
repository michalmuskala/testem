# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_version do
    quiz nil
    content "MyText"
  end
end
