extends TileMap

export (Color, RGB) var red
export (Color, RGB) var cyan

var tile
var current_color
var is_buildable

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	tile = world_to_map(mouse_pos)
	$SelectionTool.position = map_to_world(tile)
	
	# TODO: Change to if money is enough and cellv == 67
	is_buildable = get_cellv(tile) == 75
	
	if is_buildable:
		current_color = Color(0.356863, 0.835294, 0.721569)
	else:
		current_color = Color(0.835294, 0.356863, 0.356863)
	
	$SelectionTool.material.set_shader_param('current_color', current_color)

func _input(event):
	if event.is_action_pressed("build") and is_buildable:
		set_cellv(tile, 100)
