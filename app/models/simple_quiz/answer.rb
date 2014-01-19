module SimpleQuiz
  class Answer
    # include ActiveModel::Naming
    attr_accessor :text, :correct, :was

    def initialize(attributes)
      self.text = attributes[:text]
      self.correct = attributes[:correct]
    end

    def to_hash
      {
        text: text,
        correct: correct
      }
    end
  end
end