require "./dice"


class Player
  def initialize(name, dice)
    @dice = dice
    @name = name
  end

  def name
    puts @name
  end


  def dice
   @dice
  end
end


class Game
  
attr :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def play!
    loop do
      puts "type 'r' to roll the dice."
      player_answer = gets.chomp
      while player_answer != "r"
        puts "invalid responce, please type 'r' to roll the dice"
        player_answer = gets.chomp
      end
      scorep1 = @player1.dice.roll
      puts "You rolled a #{scorep1}."
      scorep2 = @player2.dice.roll
      puts "I rolled a #{scorep2}"
      @turn += 1
      if scorep1 > scorep2
      @winner = @player1
    elsif scorep2 > scorep1
      @winner = @player2
    end
      break if @winner 
    end
  end

  def winner  
    @winner
    puts "#{@winner.name} wins"
  end
  # Players roll their dice until someone wins
end
