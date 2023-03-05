extends InteractionManager

signal unlock_phonebooth

func hover() -> void:
	$Sprite2D.material.set_shader_parameter("opacity", 0.4)
	$Sprite2D2.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Sprite2D.material.set_shader_parameter("opacity", 0)
	$Sprite2D2.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void:
	super.recieve_interaction(interacter)
	$"../AnimationPlayer".play("FadeMessage")
	unlock_phonebooth.emit()
	visible = false

