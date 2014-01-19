require 'spec_helper'

describe QuizVersion do
  let(:quiz) { create :quiz_with_questions_and_answers }

  describe 'creating new version' do
    it 'should not allow standalone version' do
      expect(QuizVersion.new.valid?).to be_falsy
    end

    it 'should be valid with a quiz' do
      expect(QuizVersion.new(quiz: quiz).valid?).to be_truthy
      expect(quiz.versions.build.valid?).to be_truthy
    end

    it 'should populate content' do
      version = QuizVersion.create(quiz: quiz)
      expect(version.content).to eq quiz.to_json
    end
  end

  describe '#questions' do
    let(:version) { QuizVersion.create(quiz: quiz) }

    it 'should return SimpleQuiz::Question array' do
      expect(version.questions).to be_a Array
      expect(version.questions[0]).to be_a SimpleQuiz::Question
    end
  end
end
