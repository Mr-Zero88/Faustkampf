@tool
extends Node2D

@export var GridSize: Vector2 = Vector2(8, 8)

@export var TileSize: float = 50
@export var TileGap: float = 5

@export var Tile: PackedScene

func _ready():
	for x in range(GridSize.x):
		for y in range(GridSize.y):
			genTile(x, y)

func placePice(x: int, y: int, type: Global.PieceType):
	var tile = getTile(x, y)
	#var tile = self.find_child("tile_0_0")
	if(tile == null):
		return
	tile.type = type

func getTile(x: int, y: int) -> Tile:
	return self.find_child("tile_" + str(x) + "_" + str(y))

func genTile(x: int, y: int):
	print("X: ", x, " Y: ", y)
	var tile: Node = Tile.instantiate()
	tile.set_name("tile_" + str(x) + "_" + str(y))
	
	tile.position = Vector2(TileSize / 2 + x * (TileSize + TileGap), TileSize / 2 + y * (TileSize + TileGap))
	tile.connect("click", func():
		print("click", x, y)
		placePice(x, y, Global.PieceType.Pawn)
		# SendLocation.emit(temp.name))
	)
	add_child(tile)
