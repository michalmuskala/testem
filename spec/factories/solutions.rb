# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :solution do
    quiz_version nil
    answers "MyText"
    user nil
  end
end
