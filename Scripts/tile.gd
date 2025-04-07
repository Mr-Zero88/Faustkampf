extends Area2D
class_name Tile

var hover: bool = false;

@export var type: Global.PieceType

signal click

func _mouse_enter():
	hover = true

func _mouse_exit():
	hover = false

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("game_select") && hover):
		click.emit()
