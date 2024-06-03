@tool
class_name Square
extends Button

const X_TEXTURE: Texture = preload('res://assets/images/tictac_x.svg')
const O_TEXTURE: Texture = preload('res://assets/images/tictac_o.svg')

signal mark_pressed(square: Square, index: int)

@export_enum('NONE', 'X', 'O') var mark: int = Mark.NONE:
	set(value):
		match value:
			Mark.X: icon = X_TEXTURE
			Mark.O: icon = O_TEXTURE
			Mark.NONE:
				icon = null
				dimmed = false
		mark = value

var dimmed := false:
	set(value):
		modulate.a = 0.3 + 0.7 * int(not value)
		dimmed = value

enum Mark { NONE, X, O }


func is_marked() -> bool:
	return mark != Mark.NONE


func _on_pressed() -> void:
	var index: int = get_parent().get_children().find(self)
	mark_pressed.emit(self, index)
