class Game
  attr_accessor :current_player

  def initialize
    @current_player = "Player 1"
  end

  def switch_players
    if @current_player == Player1.name
      @current_player = Player2.name
    else
      @current_player = Player1.name
    end
  end

  def announce_scores
    puts "P1: #{Player1.lives}/3 vs. P2: #{Player2.lives}/3"
  end

  def turns
    while Player1.lives > 0 && Player2.lives > 0
      puts "-----NEW TURN-----"
      question = Question.new
      puts "#{@current_player}: #{question.generate_question}"
      
      answer = gets.chomp.to_i

      if (question.number1.to_i + question.number2.to_i == answer)
        puts "#{current_player} YES! You are correct!"
        announce_scores
      else
        puts "#{current_player}: Sorry! That is incorrect"
        if current_player == Player1.name
          Player1.lose_life
        elsif current_player == Player2.name
          Player2.lose_life
        end
      end

      switch_players

    end
  end

  def game_over
    puts "-----GAME OVER-----"
    if Player1.lives == 0
      puts "Player 2 wins with a score of #{Player2.lives}/3"
    elsif Player2.lives == 0
      puts "Player 1 wins with a score of #{Player1.lives}/3"
    end
    puts "Goodbye!"
  end

  def play
    puts "Welcome to Dani's Command Line Math Game!"

    turns

    game_over
  end
end