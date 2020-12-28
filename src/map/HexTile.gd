extends Node2D

class_name HexTile

const outer_rad = 40.0
const inner_rad = outer_rad * sqrt(3) / 2

func _ready():
	var poligons := PoolVector2Array([
		Vector2(0.0, outer_rad),
		Vector2(inner_rad, 0.5 * outer_rad),
		Vector2(inner_rad, -0.5 * outer_rad),
		Vector2(0.0, -outer_rad),
		Vector2(-inner_rad, -0.5 * outer_rad),
		Vector2(-inner_rad, 0.5 * outer_rad)
	])
	$Polygon.polygon = poligons

func colorin(x, y):
	$Polygon.color = Color(x, y, 0)
