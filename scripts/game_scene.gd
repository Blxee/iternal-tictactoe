extends Control

var turn: Square.Mark = [Square.Mark.X, Square.Mark.O].pick_random()


func _on_mark_pressed(square: Square, index: int) -> void:
	if not square.is_marked():
		square.mark = turn
		_swap_turn()


func _swap_turn() -> void:
	turn = Square.Mark.X if (turn == Square.Mark.O) else Square.Mark.O
