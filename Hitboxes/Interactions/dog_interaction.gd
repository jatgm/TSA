extends InteractionManager

signal start(interacter)
signal leave

func enter_bound(interacter):
	start.emit(interacter)

func exit_bound():
	$DialogPlayer.finish()
	current_interaction = null
	leave.emit()

func hover() -> void:
	$dog_sprite.material.set_shader_parameter("opacity", 0.3)
	
func unhover() -> void:
	$dog_sprite.material.set_shader_parameter("opacity", 0)
