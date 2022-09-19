class Game

  def initialize
    @current_player = "Player 1"
    @player1 = Player.new(1)
    @player2 = Player.new(2)
  end

  def switch_players
    if @current_player == @player1.name
      @current_player = @player2.name
    else
      @current_player = @player1.name
    end
  end

  def announce_scores
    puts "P1: #{@player1.lives}/3 vs. P2: #{@player2.lives}/3"
  end

  def check_answer(question, ans)
    if (question.number1.to_i + question.number2.to_i == ans)
      puts "#{@current_player} YES! You are correct!"
      announce_scores
    else
      puts "#{@current_player}: Sorry! That is incorrect"
      if @current_player == @player1.name
        @player1.lose_life
      elsif @current_player == @player2.name
        @player2.lose_life
      end
    end
  end

  def turns
    while @player1.lives > 0 && @player2.lives > 0
      puts "-----NEW TURN-----"
      
      question = Question.new
      puts "#{@current_player}: #{question.generate_question}"
      
      answer = gets.chomp.to_i

      check_answer(question, answer)

      switch_players

    end
  end

  def game_over
    puts "-----GAME OVER-----"
    if @player1.lives == 0
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    elsif @player2.lives == 0
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    end
    puts "Goodbye!"
  end

  def play
    puts "Welcome to Dani's Command Line Math Game!"

    turns

    game_over
  end
end