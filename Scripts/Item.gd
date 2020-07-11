extends Button

class_name Building

const TYPE_HOUSE = 0
const TYPE_BANK = 1
const HOUSE = "res://Assets/Isometric Buildings/House"
const BANK = "res://Assets/Isometric Buildings/Bank"

export var build: = ""
export var price: = 0
export var generate: = 0
export var type: = 0

func initialize(b, p, g, t, a):
	self.build = b
	self.price = p
	self.generate = g
	self.type = t
	$Amount.text = str(a)
	add_texture()
	$AnimationPlayer.play("Item In")
	
func add_texture():
	var num: = randi() % 9 + 1
	var random_path: = ""
	
	if(self.type == TYPE_HOUSE):
		random_path = HOUSE + "/" + str(num) + ".png"
	elif(self.type == TYPE_BANK):
		random_path = BANK + "/" + str(num) + ".png"
		
	$".".icon = load(random_path)
