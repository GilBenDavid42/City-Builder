extends Control

export(String, FILE, "*.tscn") var next_level

func _ready():
	$Fade.fade_out()

func _on_Start_button_up() -> void:
	$Fade.fade_in()
	
func _on_Exit_button_up() -> void:
	get_tree().quit()

func _on_Fade_fade_in() -> void:
	get_tree().change_scene(next_level)

func _on_Fade_fade_out() -> void:
	$Buttons/AnimationPlayer.play("Buttons In")
