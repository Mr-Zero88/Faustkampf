@tool
extends Area2D
class_name Tile

var hover: bool = false;

@export var type: Global.PieceType:
	set(value):
		type = value
		var piece = Pieces[type]
		print(piece)
		$icon.texture = piece.icon

@export var Pieces: Dictionary[Global.PieceType, Piece]

signal click

func _mouse_enter():
	hover = true

func _mouse_exit():
	hover = false

func _process(delta: float) -> void:
	if(Engine.is_editor_hint()):
		return
	if(Input.is_action_just_pressed("game_select") && hover):
		click.emit()
