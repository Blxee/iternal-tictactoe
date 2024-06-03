extends Control

const WIN_STATES: Array[Array] = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6],
]

var turn: Square.Mark = [Square.Mark.X, Square.Mark.O].pick_random()
var stack = []

@onready var grid_container: GridContainer = $AspectRatioContainer/MarginContainer/GridContainer


func _on_mark_pressed(square: Square, index: int) -> void:
	if not square.is_marked():
		square.mark = turn
		stack.append(square)

		if stack.size() > 6:
			var front: Square = stack.pop_front()
			front.mark = Square.Mark.NONE

		if stack.size() == 6:
			stack.front().dimmed = true

		var winner := _check_winner()
		if winner != Square.Mark.NONE:
			print(winner)
			get_tree().quit()

		_swap_turn()


func _check_winner() -> Square.Mark:
	for state: Array in WIN_STATES:
		for mark: int in [Square.Mark.X, Square.Mark.O]:
			if state.all(func(x): return grid_container.get_child(x).mark == mark):
				return mark
	return Square.Mark.NONE


func _swap_turn() -> void:
	turn = Square.Mark.X if (turn == Square.Mark.O) else Square.Mark.O
