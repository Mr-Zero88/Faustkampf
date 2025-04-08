#@tool
extends Node2D

@export var GridSize: Vector2 = Vector2(8, 8)

@export var TileSize: float = 50
@export var TileGap: float = 5

@export var Tile: PackedScene

var tiles: Dictionary[String, Tile] = {}

func _ready():
	for x in range(GridSize.x):
		for y in range(GridSize.y):
			genTile(x, y)
	placePice(0, 0, Global.PieceType.Rook)
	placePice(1, 0, Global.PieceType.Knight)
	placePice(2, 0, Global.PieceType.Bishop)
	placePice(3, 0, Global.PieceType.Queen)
	placePice(4, 0, Global.PieceType.King)
	placePice(5, 0, Global.PieceType.Bishop)
	placePice(6, 0, Global.PieceType.Knight)
	placePice(7, 0, Global.PieceType.Rook)
	placePice(0, 1, Global.PieceType.Pawn)
	placePice(1, 1, Global.PieceType.Pawn)
	placePice(2, 1, Global.PieceType.Pawn)
	placePice(3, 1, Global.PieceType.Pawn)
	placePice(4, 1, Global.PieceType.Pawn)
	placePice(5, 1, Global.PieceType.Pawn)
	placePice(6, 1, Global.PieceType.Pawn)
	placePice(7, 1, Global.PieceType.Pawn)
	
	placePice(0, 7, Global.PieceType.Rook)
	placePice(1, 7, Global.PieceType.Knight)
	placePice(2, 7, Global.PieceType.Bishop)
	placePice(3, 7, Global.PieceType.Queen)
	placePice(4, 7, Global.PieceType.King)
	placePice(5, 7, Global.PieceType.Bishop)
	placePice(6, 7, Global.PieceType.Knight)
	placePice(7, 7, Global.PieceType.Rook)
	placePice(0, 6, Global.PieceType.Pawn)
	placePice(1, 6, Global.PieceType.Pawn)
	placePice(2, 6, Global.PieceType.Pawn)
	placePice(3, 6, Global.PieceType.Pawn)
	placePice(4, 6, Global.PieceType.Pawn)
	placePice(5, 6, Global.PieceType.Pawn)
	placePice(6, 6, Global.PieceType.Pawn)
	placePice(7, 6, Global.PieceType.Pawn)

func placePice(x: int, y: int, type: Global.PieceType):
	var tile = getTile(x, y)
	#var tile = self.find_child("tile_0_0")
	print(tile)
	if(tile == null):
		return
	tile.type = type

func getTile(x: int, y: int) -> Tile:
	return tiles["tile_" + str(x) + "_" + str(y)]
	# return self.find_child("tile_" + str(x) + "_" + str(y))

func genTile(x: int, y: int):
	print("X: ", x, " Y: ", y)
	var tile: Node = Tile.instantiate()
	tile.set_name("tile_" + str(x) + "_" + str(y))
	#print(tile.name)
	tile.position = Vector2(TileSize / 2 + x * (TileSize + TileGap), TileSize / 2 + y * (TileSize + TileGap))
	tile.connect("click", func():
		print("click", x, y)
		print(tile.piece)
		#tile.select = true
		# tile.type = Global.PieceType.Pawn
		#placePice(x, y, Global.PieceType.Pawn)
		# SendLocation.emit(temp.name))
	)
	#tile.owner = get_tree().edited_scene_root
	if(x % 2 == 0 && y % 2 == 0 || x % 2 == 1 && y % 2 == 1):
		tile.background = preload("res://art/tile-odd.png")
	else:
		tile.background = preload("res://art/tile-even.png")
	tile.select = false
	add_child(tile)
	tiles["tile_" + str(x) + "_" + str(y)] = tile
	
