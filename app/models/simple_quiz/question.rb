module SimpleQuiz
  class Question
    attr_accessor :text
    attr_reader :answers

    def initialize(attributes)
      self.text = attributes[:text]
      self.answers = attributes[:answers]
    end

    def answers=(hash)
      @answers = hash.map do |answer|
        SimpleQuiz::Answer.new(answer)
      end
    end

    def persisted?
      false
    end
  end
end