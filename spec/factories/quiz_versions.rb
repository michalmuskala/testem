# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_version do
    quiz { create :quiz_with_questions_and_answers }
  end
end
