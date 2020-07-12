extends Control

const RED = Color(1,0,0)
const BLUE = Color(0,1,1)
const PATH = "PanelContainer/VBoxContainer/"
const AMOUNT = "Amount"
const CHANGE = "Change"

func add_score(name, num):
	var add_path = PATH + name
	var amount = int(get_node(add_path + AMOUNT).text) + num
	get_node(add_path + CHANGE).text = ""
	var text = get_node(add_path + CHANGE).text
	
	if(num != 0):
		get_node(add_path + AMOUNT).text = String(amount)
		
		if(num > 0):
			get_node(add_path + CHANGE).modulate = BLUE
			text += "+"
		
		else:
			get_node(add_path + CHANGE).modulate = RED
		
		text += String(num)
		
		get_node(add_path + CHANGE).text = text
		$AnimationPlayer.play(name + " " + CHANGE)
