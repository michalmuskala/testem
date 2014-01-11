FactoryGirl.define do
  factory :question do
    sequence(:text) { |n| "Question text ##{n}" }

    factory :question_with_ansers do
      ignore do
        answers_count 5
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end
    end
  end
end
