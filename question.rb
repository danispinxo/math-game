class Question
  attr_accessor :question, :number1, :number2

  def initialize
    @question 
    @number1 = rand(1...20)
    @number2 = rand(1...20)
  end

  def generate_question
    # random number generation
    question = "What does #{number1} plus #{number2} equal?"
  end

end