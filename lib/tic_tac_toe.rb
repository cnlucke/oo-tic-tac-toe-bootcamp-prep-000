class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    index = input_to_index(input)
    if(valid_move?(index))
      move(index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !(position_taken?(index))
      true
    else
      false
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
end
