class Game 
  def initialize 
    @player1 = Player.new("1")
    @player2 = Player.new("2")
    @players = [@player1, @player2]
  end
  def next_round
    puts "------- NEW TURE ------"
    @players.rotate!
  end
  def display_status
    puts "P#{@player1.name}: #{@player1.score}/3 vs P#{@player2.name}:#{@player2.score}/3"
  end 

  def winner
    winner = @players.find{|player| !player.dead?}
    puts "Player #{winner.name} wins with a score of #{winner.score}/3"
    puts "--------- GAME OVER --------"
    puts "Good bye!"
  end

  def game_over?
    @players.select{|player| player.dead?}.count > 0
  end

  def play

    while (!game_over?) do
      ask = @players.first
      res = @players.last
      puts "Player #{ask.name}: What does #{ask.first} plus #{ask.second} equal? \n"
      print "> " 
      answer = gets.chomp.to_i 
        if ask.first + ask.second == answer 
          puts "Player #{ask.name}: YES! You are correct."
        else 
          puts "Player #{ask.name}: Seriously? No!"
          res.score -= 1
        end
      display_status
      next_round
    end
    winner
  end

end 