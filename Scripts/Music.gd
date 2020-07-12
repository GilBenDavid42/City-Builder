extends AudioStreamPlayer

onready var tween_out = get_node("Tween")
onready var filter = AudioServer.get_bus_effect(AudioServer.get_bus_index("Music"), 0)

var transition_duration = 1.00
var transition_type = 1

func _ready() -> void:
	filter.cutoff_hz = 10000
	$".".play()

func fade_in():
	tween_out.interpolate_property(filter, "cutoff_hz", 10000, 500, transition_duration, transition_type, Tween.EASE_IN_OUT, 0)
	tween_out.start()

func fade_out():
	tween_out.interpolate_property(filter, "cutoff_hz", 500, 10000, transition_duration, transition_type, Tween.EASE_IN_OUT, 0)
	tween_out.start()
