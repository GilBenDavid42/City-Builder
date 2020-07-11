extends Node2D

var tile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	tile = world_to_map(mouse_pos)
	$SelectionTool.position = map_to_world(tile)
