extends CanvasLayer

signal fade_in

func fade_in():
	$AnimationPlayer.play("Fade In")
	
func fade_out():
	$AnimationPlayer.play("Fade In")

func _on_animation_finished(anim_name: String) -> void:
	if(anim_name == "Fade In"):
		emit_signal("fade_in")
		
	if(anim_name == "Fade Out"):
		emit_signal("fade_out")
