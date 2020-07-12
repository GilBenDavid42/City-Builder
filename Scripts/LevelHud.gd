extends Control

const START = 0
const PAUSE = 1
const WIN = 2
const LOSE = 3

export(String, FILE, "*.tscn") var start_level
export(String, FILE, "*.tscn") var next_level

var focus: = false
var open: = false

signal confirm

func _ready() -> void:
	$Fade.fade_out()
	$".".next_level = $Menu.next_level
	$".".start_level = $Menu.start_level

func click():
	$Menu/Sounds/Click.play()

func increase():
	$Menu/Sounds/Increase.play()

func plant():
	$Menu/Sounds/Plant.play()

func Hover():
	$Menu/Sounds/Hover.play()

func _on_Tileset_destroy() -> void:
	$Popups/WindowDialog.popup()
	focus = true

func _on_Tileset_pause() -> void:
	focus = true
	if($Menu.mode == PAUSE):
		$Menu.pause()
	
	elif($Menu.mode == WIN):
		$Menu.open()
	
	elif($Menu.mode == LOSE):
		$Menu.open()

func _on_WindowDialog_confirmed() -> void:
	emit_signal("confirm")
	focus = false

func _on_WindowDialog_popup_hide() -> void:
	focus = false

func _on_Menu_closed() -> void:
	focus = false
