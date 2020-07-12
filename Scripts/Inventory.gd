extends Control

onready var item_scene: = preload("res://Scenes/Item.tscn")

var item_arr: = []
const ITEM_PATH: = "PanelContainer/ScrollContainer/VBoxContainer"

func _ready():
	add_item(1)
	remove_item(0)
	
func add_item(type):
	var item = item_scene.instance()
	item.initialize("House", 1, 2, type, 5)
	$PanelContainer/ScrollContainer/VBoxContainer.add_child(item)

func remove_item(id):
	get_node(ITEM_PATH).remove_child(get_node(ITEM_PATH).get_child(id))
