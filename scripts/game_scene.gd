extends Control

var turn: Square.Mark = [Square.Mark.X, Square.Mark.O].pick_random()
var stack = []


func _on_mark_pressed(square: Square, index: int) -> void:
	if not square.is_marked():
		square.mark = turn
		_swap_turn()
		stack.append(square)
		if stack.size() > 6:
			var front: Square = stack.pop_front()
			front.mark = Square.Mark.NONE


func _swap_turn() -> void:
	turn = Square.Mark.X if (turn == Square.Mark.O) else Square.Mark.O
