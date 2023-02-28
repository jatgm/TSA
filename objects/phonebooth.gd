extends Node2D

enum PHONEBOOTH_STATE {USING, NOT_USING}

@export var open = false
var state = PHONEBOOTH_STATE.NOT_USING

func _on_interaction_manager_enter_phonebooth(interacter):
	if open:
		if state == PHONEBOOTH_STATE.NOT_USING:
			state = PHONEBOOTH_STATE.USING
			var tween = get_tree().create_tween()
			interacter.moving = false
			tween.tween_property(interacter, "position", position, 0.3).set_trans(Tween.TRANS_SINE)
			$AnimationPlayer.play("add_blackbars")
			await get_tree().create_timer(0.4).timeout
			$UI.visible = true
		else:
			state = PHONEBOOTH_STATE.NOT_USING
			var tween = get_tree().create_tween()
			$AnimationPlayer.play("remove_blackbars")
			tween.tween_property(interacter, "position", position+Vector2(0,40), 0.3).set_trans(Tween.TRANS_SINE)
			$UI.visible = false
			await get_tree().create_timer(0.4).timeout
			interacter.moving = true
	else:
		$InteractionManager/DialogPlayer.start_dialogue()
		
		

