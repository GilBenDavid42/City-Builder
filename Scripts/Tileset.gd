extends Node2D

export (Color, RGB) var red
export (Color, RGB) var cyan

const DELETE_ID = -1
const BUILD_ID = 1
const DEFAULT_ID = 75
const BUILD = "build"
const DESTROY = "destroy"
const PAUSE = "pause"

var focus = false
var tile
var is_build = false
var is_ground = false

signal destroy
signal pause

func _physics_process(delta: float) -> void:
	focus = get_parent().get_node("LevelHud").focus
	if(not focus):
		var mouse_pos = get_global_mouse_position()
		var current_color = red
		tile = $LandscapeTileset.world_to_map(mouse_pos)
		$SelectionTool.position = $LandscapeTileset.map_to_world(tile)
		# TODO: Change to if money is enough and cellv == 67
		
		is_ground = $LandscapeTileset.get_cellv(tile) == DEFAULT_ID
		is_build = $BuildingTileset.get_cellv(tile) == DELETE_ID
		
		if is_ground and is_build:
			current_color = cyan
		
		$SelectionTool.material.set_shader_param('current_color', current_color)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(PAUSE):
		emit_signal(PAUSE)
	
	if(not focus):
		if event.is_action_pressed(BUILD) and (is_ground and is_build):
			$BuildingTileset.set_cellv(tile, BUILD_ID)
		
		elif event.is_action_pressed(DESTROY) and (is_ground and not is_build):
			emit_signal(DESTROY)

func _on_LevelHud_confirm() -> void:
	$BuildingTileset.set_cellv(tile, DELETE_ID)
