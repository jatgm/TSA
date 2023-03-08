extends InteractionManager

func recieve_interaction(interacter) -> void:
	$DialogPlayer.start_dialogue(interacter)
	if started:
		started = false
		$AudioStreamPlayer.playing = true
	
