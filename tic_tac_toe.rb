class Game

  WIN_COMBINATION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal win combination
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [0, 4, 8], [2, 4, 6]
  ]
 
  def initialization
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @players = { :X => "", :O => ""}
    @pick = []
    @turns = 0
  end

  def play
    get_player_name
    display_board
    play_game until game_over
  end


  def get_player_name
    puts "Player X, please enter your name:"
    @players[:X] = gets.chomp
    puts "Player O, please enter your name:"
    @players[:O] = gets.chomp
  end
  
  def display_board
    puts "
    #{@board[0]} | #{@board[1]} | #{@board[2]}\n
    #{@board[3]} | #{@board[4]} | #{@board[5]}\n
    #{@board[6]} | #{@board[7]} | #{@board[8]}
    "
  end

  def valid_move?(move)
    move.to_i.between?(0, 8) && !@pick.include?(move.to_i)
  end

  def player_turn(player)
    puts "Player #{@players[player]} please enter your number between 0-8"
    move = gets.chomp.to_i
    if valid_move?(move)
      @board[move] = player.to_s
      @turns += 1
      @pick << move
      display_board
    else
      puts "You should pick a number between 0 and 8"
      player_turn(player)
    end
  end

  def check_winner
    WIN_COMBINATION.any? do |combo|
      combo.all? { |index| @board[index] == "X" } ||
      combo.all? { |index| @board[index] == "O" }
    end
  end

  def play_game
    player = @turns.even? ? :X : :O
    player_turn(player)
    if check_winner
      puts "Congratulations #{@players[player]}! It is your victory!"
    elsif @player_turn == 9
      puts "It is a tie!"
    else
      play_game
    end
  end

  def game_over
    check_winner || @turns == 9
  end

end

# puts "Welcome to the Tic Tac Toe game! Let's play!"
# game = Game.new
# game.play