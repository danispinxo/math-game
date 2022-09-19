class Game
  attr_accessor :current_player

  def initialize
    @current_player = "Player 1"
  end

  def loop
    while
      puts "Player #{@current_player}: #{question.generate_question}"
      
      answer = gets.chomp.to_i

      if !question.correct?(answer) 
        current_player.lose_life
      end

      if current_player == Player1.name
        current_player = Player2.name
      else
        current_player = Player1.name
      end

    end
  end
end