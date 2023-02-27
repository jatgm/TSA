extends Node2D

enum PHONEBOOTH_STATE {USING, NOT_USING}

var state = PHONEBOOTH_STATE.NOT_USING

func _on_interaction_manager_enter_phonebooth(interacter):
	if state == PHONEBOOTH_STATE.NOT_USING:
		state = PHONEBOOTH_STATE.USING
		var tween = get_tree().create_tween()
		interacter.moving = false
		tween.tween_property(interacter, "position", position, 0.3).set_trans(Tween.TRANS_SINE)
		$AnimationPlayer.play("add_blackbars")
	else:
		state = PHONEBOOTH_STATE.NOT_USING
		var tween = get_tree().create_tween()
		$AnimationPlayer.play("remove_blackbars")
		tween.tween_property(interacter, "position", position+Vector2(0,40), 0.3).set_trans(Tween.TRANS_SINE)
		await get_tree().create_timer(0.3).timeout
		interacter.moving = true
		

