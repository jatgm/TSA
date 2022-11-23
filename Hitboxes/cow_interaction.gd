extends InteractionManager

func recieve_interaction() -> void:
	$DialogPlayer.start_dialogue()
	
func exit_bound() -> void:
	$DialogPlayer.finish()
