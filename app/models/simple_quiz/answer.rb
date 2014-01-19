module SimpleQuiz
  class Answer
    attr_accessor :text, :correct

    def initialize(attributes = {})
      self.text = attributes[:text]
      self.correct = attributes[:correct]
    end

    def persisted?
      false
    end
  end
end