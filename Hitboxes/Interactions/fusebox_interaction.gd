extends InteractionManager

func recieve_interaction(interacter) -> void:
	$DialogPlayer.start_dialogue()
	if started:
		started = false
		$AudioStreamPlayer.playing = true
