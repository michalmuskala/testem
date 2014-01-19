class Solution < ActiveRecord::Base
  belongs_to :quiz_version
  belongs_to :user

  validates_presence_of :user, :quiz_version, :answers

  before_save :compute_mark

  def answers=(hash)
    temp = hash.values.map { |e| e['answers'].values.map { |e| !e['response'].to_i.zero? } }
    write_attribute(:answers, ActiveSupport::JSON.encode(temp))
  end

  def decoded
    @decoded ||= ActiveSupport::JSON.decode(self[:answers])
  end

private

  def compute_mark
    mark = 0
    quiz_version.questions.each_with_index do |question, question_index| 
      question.answers.each_with_index do |answer, answer_index|
        mark += 1 if decoded[question_index][answer_index] == answer.correct
      end
    end
    self.mark = mark
  end
end
