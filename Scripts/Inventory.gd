extends Control

onready var item_scene: = preload("res://Scenes/Item.tscn")

var item_arr: = []

func _ready():
	add_item(1)
	add_item(1)
	add_item(1)
	add_item(1)
	add_item(1)
	
func add_item(type):
	var item = item_scene.instance()
	item.initialize("House", 1, 2, type, 5)
	$PanelContainer/ScrollContainer/VBoxContainer.add_child(item)
