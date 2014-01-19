require "spec_helper"

describe Quiz do
  
  describe '#as_json' do
    let(:quiz) { create :quiz_with_questions_and_answers }
    let(:json) { quiz.as_json }

    it 'should include correct keys' do
      expect(json).to have_key 'questions'
      expect(json).to have_key 'name'
      expect(json).not_to have_key 'id'
      expect(json['questions'].length).to eq quiz.questions.count
      expect(json['questions'][0]).to have_key 'text'
      expect(json['questions'][0]).to have_key 'answers'
      expect(json['questions'][0]).not_to have_key 'id'
      expect(json['questions'][0]['answers'].length).to eq quiz.questions.first.answers.count
      expect(json['questions'][0]['answers'][0]).to have_key 'text'
      expect(json['questions'][0]['answers'][0]).to have_key 'correct'
      expect(json['questions'][0]['answers'][0]).not_to have_key 'id'
    end
  end

  describe '#current_version' do
    let(:quiz) { create :quiz_with_questions_and_answers }

    it 'should return new version when none is present' do
      expect(quiz.versions.count).to eq 0

      expect(quiz.current_version).to be_a QuizVersion
    end

    it 'should return new version when quiz is changed' do
      ver1 = quiz.versions.create
      quiz.update name: 'New name'

      expect(quiz.current_version).not_to eq ver1
    end
  end
end