@tool
class_name Square
extends Button

signal mark_pressed(square: Square, index: int)

@export_enum('NONE', 'X', 'O') var mark: int = Mark.NONE:
	set(value):
		match value:
			Mark.X: icon = x_texture
			Mark.O: icon = o_texture
			Mark.NONE: icon = null
		mark = value

@export_group('Textures')
@export var x_texture: Texture = preload('res://assets/images/tictac_x.svg')
@export var o_texture: Texture = preload('res://assets/images/tictac_o.svg')

enum Mark { NONE, X, O }


func is_marked() -> bool:
	return mark != Mark.NONE


func _on_pressed() -> void:
	var index: int = get_parent().get_children().find(self)
	mark_pressed.emit(self, index)
