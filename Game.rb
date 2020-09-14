class Game

  attr_accessor :player1, :player2, :game_over, :questions, :player1_turn, :currentPlayer

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @player1_turn = true
    @game_over = false
    @currentPlayer = player1
    @questions = [
      {
        question: "What is 22+2",
        answer: "24"
      },
      {
        question: "What is 13+21",
        answer: "34"
      },
      {
        question: "What is 3+3",
        answer: "6"
      },
      {
        question: "What is 1+1",
        answer: "2"
      }    
    ]
  end

  def ask_question()

    #Check whose turn it is
    if player1_turn == true
      @currentPlayer = player1
    else
      @currentPlayer = player2
    end

    randomQuestion = questions.sample
    puts "Player #{self.currentPlayer.player}: #{randomQuestion[:question]} ?"

    #Get users response
    user_answer = gets.chomp
    self.get_answer(user_answer, randomQuestion[:answer])

    #Change user turn
    @player1_turn = !player1_turn  
  end

  def get_answer(answer, correct_answer)
    if answer == correct_answer
      puts "Correct !"
    else 
      puts "Wrong !"
     @currentPlayer.loose_life
    end

    self.check_gameover
    puts "P1: #{player1.lives}/3 vs. P2: #{@player2.lives}/3"
  end

  def check_gameover
    if @player1.lives == 0
      puts "GAME OVER"
      puts"Player 2 wins with a score of  #{@player2.lives}/3"
      @game_over = true
    elsif @player2.lives == 0
      puts "GAME OVER"
      puts"Player 1 wins with a score of  #{@player1.lives}/3"
     @game_over = true
    end
  end

end
