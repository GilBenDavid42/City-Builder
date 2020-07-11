extends Control

export(String, FILE, "*.tscn") var next_level

func _on_Start_button_up() -> void:
	get_tree().change_scene(next_level)

func _on_Exit_button_up() -> void:
	get_tree().quit()
