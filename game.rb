class Game
  attr_accessor :current_player

  def initialize
    @current_player = "Player 1"
  end

  def turns
    while Player1.lives > 0 && Player2.lives > 0
      question = Question.new
      puts "#{@current_player}: #{question.generate_question}"
      
      answer = gets.chomp.to_i

      if (question.number1.to_i + question.number2.to_i == answer)
        puts "#{current_player} YES! You are correct!"

      else
        puts "#{current_player}: NO WAY!"
        if current_player == Player1.name
          Player1.lose_life
          puts "P1: #{Player1.lives}/3 vs. P2: #{Player2.lives}/3"
        elsif current_player == Player2.name
          Player2.lose_life
          puts "P1: #{Player1.lives}/3 vs. P2: #{Player2.lives}/3"
        end
      end

      if current_player == Player1.name
        current_player = Player2.name
      else
        current_player = Player1.name
      end

    end
  end
end