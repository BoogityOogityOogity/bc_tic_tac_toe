$board = [[:top1,:top2,:top3],[:mid1,:mid2,:mid3],[:bot1,:bot2,:bot3]]
$player = 0
$gameOn = true
$players = {1=>'X', 2=>'O'}
$map = {:top1=>[0,0],:top2=>[0,1],:top3=>[0,2],:mid1=>[1,0],:mid2=>[1,1],:mid3=>[1,2],:bot1=>[2,0],:bot2=>[2,1],:bot3=>[2,2]}


def checkP1Win
	#puts $board.inspect
	if $board == [[0,0,0],[:mid1,:mid2,:mid3],[:bot1,:bot2,:bot3]]
		puts "Player 1 wins! They have 3 0s in the top row!"
			abort ("The game will now end.")
	elsif $board == [[:top1,:top2,:top3],[0,0,0],[:bot1,:bot2,:bot3]]
		puts "Player 1 wins! They have 3 0s in the middle row!"
			abort ("The game will now end.")
	elsif $board == [[:top1,:top2,:top3],[:mid1,:mid2,:mid3],[0,0,0]]
		puts "Player 1 wins! They have 3 0s in the bottom row!"
			abort ("The game will now end.")
	elsif $board == [[0,:top2,:top3],[0,:mid2,:mid3],[0,:bot2,:bot3]]
		puts "Player 1 wins! They have 3 0s in the left most column!"
			abort ("The game will now end.")
	elsif $board == [[:top1,0,:top3],[:mid1,0,:mid3],[:bot1,0,:bot3]]
		puts "Player 1 wins! They have 3 0s in the middle most column!"
			abort ("The game will now end.")
	elsif $board == [[:top1,:top2,0],[:mid1,:mid2,0],[:bot1,:bot2,0]]
		puts "Player 1 wins! They have 3 0s in the right most column!"
			abort ("The game will now end.")
	elsif $board == [[0,:top2,:top3],[:mid1,0,:mid3],[:bot1,:bot2,0]]
		puts "Player 1 wins! They have 3 0s in the left diagonal!"
			abort ("The game will now end.")
	elsif $board == [[:top1,:top2,0],[:mid1,0,:mid3],[0,:bot2,:bot3]]
		puts "Player 1 wins! They have 3 0s in the right diagonal!"
			abort ("The game will now end.")
	end
end


def checkP2Win
        if $board == [[1,1,1],[:mid1,:mid2,:mid3],[:bot1,:bot2,:bot3]]
                puts "Player 2 wins! They have 3 1s in the top row!"
                        abort ("The game will now end.")
        elsif $board == [[:top1,:top2,:top3],[1,1,1],[:bot1,:bot2,:bot3]]
                puts "Player 2 wins! They have 3 1s in the middle row!"
                        abort ("The game will now end.")
        elsif $board == [[:top1,:top2,:top3],[:mid1,:mid2,:mid3],[1,1,1]]
                puts "Player 2 wins! They have 3 1s in the bottom row!"
                        abort ("The game will now end.")
        elsif $board == [[1,:top2,:top3],[1,:mid2,:mid3],[1,:bot2,:bot3]]
                puts "Player 2 wins! They have 3 1s in the left most column!"
                        abort ("The game will now end.")
        elsif $board == [[:top1,1,:top3],[:mid1,1,:mid3],[:bot1,1,:bot3]]
                puts "Player 2 wins! They have 3 1s in the middle most column!"
                        abort ("The game will now end.")
        elsif $board == [[:top1,:top2,1],[:mid1,:mid2,1],[:bot1,:bot2,1]]
                puts "Player 2 wins! They have 3 1s in the right most column!"
                        abort ("The game will now end.")
        elsif $board == [[1,:top2,:top3],[:mid1,1,:mid3],[:bot1,:bot2,1]]
                puts "Player 2 wins! They have 3 1s in the left diagonal!"
                        abort ("The game will now end.")
        elsif $board == [[:top1,:top2,1],[:mid1,1,:mid3],[1,:bot2,:bot3]]
                puts "Player 2 wins! They have 3 1s in the right diagonal!"
                        abort ("The game will now end.")
	end

end


def checkMove(move)
	sq = $board[$map[move][0]][$map[move][1]]
	if sq != 0 and sq != 1
		return true
	else
		return false
	end
end


def placeMove(move)
	case move
		when :top1;$board[0][0]=$player
		when :top2;$board[0][1]=$player
		when :top3;$board[0][2]=$player 	
		when :mid1;$board[1][0]=$player
		when :mid2;$board[1][1]=$player
		when :mid3;$board[1][2]=$player
		when :bot1;$board[2][0]=$player
		when :bot2;$board[2][1]=$player
		when :bot3;$board[2][2]=$player
	end
	#$board[map[move][0]][map[move][1]] = $player
end


def showBoard

puts "#{$board[0][0]} | #{$board[0][1]} | #{$board[0][2]}
#{$board[1][0]} | #{$board[1][1]} | #{$board[1][2]}
#{$board[2][0]} | #{$board[2][1]} | #{$board[2][2]}"

end


def switchTurn
	if $player == 0
		$player = 1
	elsif $player == 1
		$player = 0
	end

	#there are multiple ways to shorten the above block
end

#main game loop here
	
puts "Lets play tick tac toe. X goes first. Please enter your choice. 
You can input top to move to the top row, mid to move to the middle row, and bot to move to the bottom row. 
You can type a number with top, mid, or bot to choose the space. For example, top3 would put your X or O in the top row, right space." #might need more instruction on exactly what to enter
while $gameOn == true
	puts "OK, Player #{$player}, it's your move."
	showBoard
	move = gets.chomp.to_sym #might have to process the input a little to make it fit our convention
	while checkMove(move) == false #checkMove(move) == false
		puts "That was an invalid move. Please try again."
		move = gets.chomp.to_s
	end
	placeMove(move)
	switchTurn
	checkP1Win
	checkP2Win
end
