extends Node2D

var current_map : HexGrid
var map_generator : MapGenerator

func _ready():
	map_generator = MapGenerator.new()
	current_map = map_generator.generate_map()
	add_child(current_map)
