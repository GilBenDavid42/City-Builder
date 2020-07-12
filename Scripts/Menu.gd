extends Control

const START = 0
const PAUSE = 1
const WIN = 2
const LOSE = 3

onready var music = get_node("/root/Music")
export(String, FILE, "*.tscn") var start_level
export(String, FILE, "*.tscn") var next_level
export var mode = 0
var is_open = false

signal closed

func _ready():
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Reset")
	$".".visible = false
	
	if(mode == START):
		$PanelContainer/VBoxContainer/Label.text = "City Builder"
		$PanelContainer/VBoxContainer/Buttons/Start.text = "Start"
		$PanelContainer/VBoxContainer/Buttons/Continue.text = "Continue"
		$PanelContainer/VBoxContainer/Buttons/Start.disabled = false
		$PanelContainer/VBoxContainer/Buttons/Continue.disabled = true
		
		$Fade.fade_out()
	
func pause():
	if(is_open):
		close()
		is_open = false
		
	else:
		open()
		is_open = true

func open():
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Reset")
	$".".visible = false
		
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Minimize")
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Panel In")
	$AnimationPlayer.play("Blur")
	
	if(mode == PAUSE):
		$PanelContainer/VBoxContainer/Label.text = "Game Paused"
		$PanelContainer/VBoxContainer/Buttons/Start.text = "Restart"
		$PanelContainer/VBoxContainer/Buttons/Continue.text = "Continue"
		$PanelContainer/VBoxContainer/Buttons/Start.disabled = false
		$PanelContainer/VBoxContainer/Buttons/Continue.disabled = false
		
	elif(mode == WIN):
		$PanelContainer/VBoxContainer/Label.text = "Level Completed!"
		$PanelContainer/VBoxContainer/Buttons/Start.text = "Restart"
		$PanelContainer/VBoxContainer/Buttons/Continue.text = "Next Level"
		$PanelContainer/VBoxContainer/Buttons/Start.disabled = true
		$PanelContainer/VBoxContainer/Buttons/Continue.disabled = false
	
	elif(mode == LOSE):
		$PanelContainer/VBoxContainer/Label.text = "Level Failed!"
		$PanelContainer/VBoxContainer/Buttons/Start.text = "Restart"
		$PanelContainer/VBoxContainer/Buttons/Continue.text = "Next Level"
		$PanelContainer/VBoxContainer/Buttons/Start.disabled = false
		$PanelContainer/VBoxContainer/Buttons/Continue.disabled = true

	music.fade_in()
	$".".visible = true

func _on_Fade_fade_in() -> void:
	var level = start_level
	
	if(mode == WIN):
		level = next_level
	
	get_tree().change_scene(level)

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
	is_open = false
	$Fade.fade_in()
	$AnimationPlayer.play_backwards("Blur")
	music.fade_out()
	
func _on_Exit_button_up() -> void:
	click()
	is_open = false
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Buttons Out")

func _on_Continue_button_up() -> void:
	click()
	is_open = false
	
	if(mode == PAUSE):
		close()
		
	elif(mode == WIN):
		$Fade.fade_in()

func hover():
	$Sounds/Hover.play()

func click():
	$Sounds/Click.play()

func close():
	$AnimationPlayer.play_backwards("Blur")
	$PanelContainer/VBoxContainer/AnimationPlayer.play("Panel Out")
	music.fade_out()
	emit_signal("closed")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if(anim_name == "Buttons Out"):
		get_tree().quit()
