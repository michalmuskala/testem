class QuizVersion < ActiveRecord::Base
  belongs_to :quiz
  has_many :solutions

  validates :quiz, presence: true

  before_save :populate_content
  before_save :compute_total

  default_scope -> { order(created_at: :desc, id: :desc) }

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

  def compute_total
    self.total = quiz.questions.reduce(0) { |sum, question| sum + question.answers.count }
  end
end
