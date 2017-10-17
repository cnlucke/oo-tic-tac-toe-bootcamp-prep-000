class TicTacToe


  def initialize(board = nil)
    @board = board || Array.new(9, " ")

    @WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # First vertical row
      [1,4,7],  # Second verical row
      [2,5,8],  # Last vertical row
      [0,4,8],  # Diagonal from top left
      [2,4,6]  # Diagonal from bottom left
    ]
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @index = input_to_index(input)
    if(valid_move?)
      move(current_player)
      display_board
    else
      turn
    end
  end

  def valid_move?
    if @index.between?(0,8) && !(position_taken?)
      true
    else
      false
    end
  end

  def position_taken?
    !(@board[@index].nil? || @board[@index] == " ")
  end

  def input_to_index(choice)
    return choice.to_i - 1
  end

  def move(current_player)
    @board[@index] = current_player
  end

  def play
    until(over?)
      turn
    end

    if(draw?)
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner(board)}!"
    end
  end
  
end
