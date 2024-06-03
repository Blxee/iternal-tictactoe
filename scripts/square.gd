@tool
extends Button

signal mark_pressed(index: int)


@export var x_texture: Texture = preload('res://assets/images/tictac_x.svg')
@export var o_texture: Texture = preload('res://assets/images/tictac_o.svg')


func _ready() -> void:
	icon = x_texture


func _on_pressed() -> void:
	mark_pressed.emit(0)
