extends Control

export(String, FILE, "*.tscn") var start_level
export var start = false

func _ready() -> void:
	$".".visible = false
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Reset")
	
	if(start):
		$Fade.fade_out()
		$PanelContainer/VBoxContainer/Buttons/Continue.disabled = true

func open():
	if(not start):
		$AnimationPlayer.play("Blur")
		$PanelContainer/VBoxContainer/AnimationPlayer.play("Panel In")
		$PanelContainer/VBoxContainer/Buttons/Continue.disabled = false

func _on_Fade_fade_in() -> void:
	get_tree().change_scene(start_level)

func _on_Fade_fade_out() -> void:
	$AnimationPlayer.play("Blur")
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Buttons In")
	$".".visible = true

func _on_Start_mouse_entered() -> void:
	hover()

func _on_Exit_mouse_entered() -> void:
	hover()

func _on_Continue_mouse_entered() -> void:
	hover()

func _on_Start_button_up() -> void:
	click()
	$Fade.fade_in()
	$AnimationPlayer.play_backwards("Blur")
	
func _on_Exit_button_up() -> void:
	click()
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Buttons Out")

func _on_Continue_button_up() -> void:
	click()
	close()

func hover():
	$Sounds/Hover.play()

func click():
	$Sounds/Click.play()

func close():
	$AnimationPlayer.play_backwards("Blur")
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Panel Out")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if(anim_name == "Buttons Out"):
		get_tree().quit()

func _on_AnimationPlayer_animation_started(anim_name: String) -> void:
	if(anim_name == "Panel In"):
		$".".visible = true
