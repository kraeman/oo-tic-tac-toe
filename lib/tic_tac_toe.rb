class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [[0,1,2], [0,3,6], [6,7,8], [2,5,8], [0,4,8], [2,4,6], [3,4,5], [1,4,7]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts '-----------'
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts '-----------'
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(number)
        index = number.to_i - 1
        index
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if (!self.position_taken?(index)) && (0 <= index) && (index <= 8)
            true
        else
            false
        end
    end

    def turn
        move = gets("Enter you position then hit enter")
        index = input_to_index(move.to_s)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def turn_count
        count = 0
        @board.each do |space|
            if space == "X" || space == "O"
                count += 1
            end
        end
        count
    end

    def current_player
        if turn_count == 0 || turn_count.even?
            @current_player = "X"
        else
            @current_player = "O"
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            winner = []
            combo.each do |space|
                if @board[space] == "X" || @board[space] == "O" || @board[space] == " "
                    winner << @board[space]
                end
            end
            if winner == ["X", "X", "X"] || winner == ["O", "O", "O"]
                return combo
            end
        end
        false
    end

    def full?
        if @board.any?(" ")
            false
        else
            true
        end
    end

    def draw?
        if full? && !won?
            true
        else
            false
        end
    end

    def over?
        if won? || draw? || full?
            true
        else
            false
        end
    end

    def winner
        if won?
            champ_combo = won?
            @board[champ_combo[0]]
        else
            nil
        end
    end

    def play
        until over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end