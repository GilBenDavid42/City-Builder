extends Node2D

export(String, FILE, "*.tscn") var next_level

func _ready() -> void:
	$Fade.fade_out()

func win():
	$Fade.fade_in()

func _on_Fade_fade_in() -> void:
	get_tree().change_scene(next_level)

func _on_Fade_fade_out() -> void:
	pass
