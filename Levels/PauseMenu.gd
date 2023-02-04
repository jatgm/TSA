extends CanvasLayer

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if $VBoxContainer.visible == false:
			$VBoxContainer.visible = true
		else:
			get_tree().paused = !get_tree().paused
			visible = !visible

func _on_settings_pressed():
	$VBoxContainer.visible = false

func _on_resume_pressed():
	get_tree().paused = !get_tree().paused
	visible = !visible

func _on_quit_pressed():
	pass # Replace with function body.
