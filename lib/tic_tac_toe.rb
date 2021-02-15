require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [    [0,1,2],
                            [3,4,5],
                            [6,7,8],
                            [0,3,6],
                            [1,4,7],
                            [2,5,8],
                            [0,4,8],
                            [2,4,6],
                            ]
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]   
    end  
    def display_board
         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
         puts "-----------"
         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
         puts "-----------"
         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i - 1
        return input
    end
     
    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
         @board[index].include?("X") || @board[index].include?("O")
        
    end

    def valid_move?(index)
        index.between?(0,8) && position_taken?(index) == false
    end

    def turn_count
        @board.count - @board.count(" ") 
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Please select a number 1-9"
        input = gets
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            puts "#{display_board}"
        else
        turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |a|
            @board[a[0]] == @board[a[1]] && @board[a[1]] == @board[a[2]] && @board[a[0]] != ' ' 
        end
    end

    def full?
        @board.all? do |t|
            t == "X" || t == "O"
        end
    end

    def draw?
        full? && won? == nil
    end

    def over? 
        full? || won?
    end

    def winner 
        if won? == nil
        else
            @board[won?[0]]  
        end
    end

    def play
        until over? || draw? do
            turn
        end
        if winner
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end       
    end




 




end
