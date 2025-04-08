extends Node2D

@export var _name = "Test-name"
@export var description = "Move To Test"
@export var tags = [1,2]

@export var moveset = [Vector2i(2,2),Vector2i(2,-2)]
@export var icon = 0

@onready var title = $card/SubViewport/Control/MarginContainer/VBoxContainer/Container/title
@onready var descriptor = $card/SubViewport/Control/MarginContainer/VBoxContainer/description

@onready var tagContainer = $card/SubViewport/Control/MarginContainer/VBoxContainer/tagContainer

@onready var board = $card/SubViewport/Control/MarginContainer/VBoxContainer/Container2/Control/Checkers

var tagImgs = [
	load("res://art/tags/antihero.png"),
	load("res://art/tags/creature.png"),
	load("res://art/tags/insane.png"),
	load("res://art/tags/kid.png"),
	load("res://art/tags/popular_hero.png"),
	load("res://art/tags/romantic.png"),
	load("res://art/tags/royal.png"),
	load("res://art/tags/scholar.png")
]

var iconPaths = [
	"res://art/icons/roock.png",
	"res://art/icons/horse.png",
	"res://art/icons/bishop.png",
	"res://art/icons/tower.png",
	"res://art/icons/queen.png",
	"res://art/icons/king.png"
]

func _ready() -> void:
	makeCard()

func makeCard():
	
	title.text = _name
	descriptor.text = description
	
	for t in tags:
		var ti = TextureRect.new()
		ti.texture = tagImgs[t]
		tagContainer.add_child(ti)
	
	var sSprite = Sprite2D.new()
	if(icon == 0):
		sSprite.texture = null
	else:
		sSprite.texture = load(iconPaths[icon + 1])
	board.add_child(sSprite)
	
	for m in moveset:
		var sp = Sprite2D.new()
		sp.texture = load("res://art/icons/target.png")
		board.add_child(sp)
		sp.position = Vector2(m) * 15

func startHover():
	pass

func endHover():
	pass
