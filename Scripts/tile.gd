@tool
extends Area2D
class_name Tile

var hover: bool = false;

@export var select: bool = false:
	set(value):
		select = value
		$selectable.visible = select

@export var background: Texture2D:
	set(value):
		background = value
		$Background.texture = background

var piece: Piece = null;

@export var type: Global.PieceType:
	set(value):
		type = value
		if(type == 0):
			$icon.texture = null
			piece = null
			return;
		piece = Pieces[type]
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
