extends Node

class_name MapGenerator

const land_hex_tile_scene = preload("res://scenes/map/HexTile/LandHexTile.tscn")
const sea_hex_tile_scene  = preload("res://scenes/map/HexTile/SeaHexTile.tscn")

const hex_grid_scene = preload("res://scenes/map/HexGrid.tscn")

const outer_radius = HexTile.outer_rad
const inner_radius = HexTile.inner_rad

var width = 10
var height = 10

var rng := RandomNumberGenerator.new()
var height_noise := OpenSimplexNoise.new()

func _ready():
	height_noise.seed = rng.randi()

func generate_map() -> HexGrid:
	var hex_grid = hex_grid_scene.instance()
	var cells = Array()
	for y in range(height):
		cells.append(Array())
		for x in (width):
			var curr_cell = create_cell(x, y)
			hex_grid.add_child(curr_cell)
			curr_cell.colorin(float(x) / width, float(y) / height)
			cells[y].append(curr_cell)
	hex_grid.tiles = cells
	return hex_grid

func create_cell(coord_x, coord_y) ->HexTile:
	var x = (coord_x + coord_y * 0.5 - coord_y / 2) * (inner_radius * 2.0)
	var y = coord_y * outer_radius * 1.5
	var pos = Vector2(x, y)
	var cell: HexTile
	if height_noise.get_noise_2d(x, y) >= -0.1:
		cell = land_hex_tile_scene.instance()
	else:
		cell = sea_hex_tile_scene.instance()
	cell.position = pos
	return cell
