class QuizVersion < ActiveRecord::Base
  belongs_to :quiz

  validates :quiz, presence: true

  before_save :populate_content

  def questions
    decoded[:questions].map do |question|
      SimpleQuiz::Question.new(question)
    end
  end

  def name
    decoded[:name]
  end

  def decoded
    @decoded ||= ActiveSupport::JSON.decode(content, symbolize_names: true)
  end

private

  def populate_content
    self.content = quiz.to_json
  end
end
