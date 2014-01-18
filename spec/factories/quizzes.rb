FactoryGirl.define do
  factory :quiz do
    sequence(:name) { |n| "Test##{n}" }

    factory :quiz_with_questions do
      ignore do
        questions_count 5
      end

      after(:create) do |quiz, evaluator|
        create_list(:question, evaluator.questions_count, quiz: quiz)
      end
    end

    factory :quiz_with_questions_and_answers do
      ignore do
        questions_count 5
      end

      after(:create) do |quiz, evaluator|
        create_list(:question_with_ansers, evaluator.questions_count, quiz: quiz)
      end
    end
  end
end
