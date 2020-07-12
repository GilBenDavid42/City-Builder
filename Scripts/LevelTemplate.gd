extends Node2D

export(String, FILE, "*.tscn") var next_level
var open: = false

func _ready() -> void:
	$Fade.fade_out()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		open = not open
		if(open):
			$Menu.open()
		else:
			$Menu.close()

func win():
	$Fade.fade_in()

func _on_Fade_fade_in() -> void:
	get_tree().change_scene(next_level)

func _on_Fade_fade_out() -> void:
	pass
