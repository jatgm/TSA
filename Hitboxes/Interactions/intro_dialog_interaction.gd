extends DialogPlayer

func _process(_delta):
	if char_count <= text_label.visible_characters:
		line_finished = true
		if in_progress:
			$Tooltip.visible = true
	else:
		$Tooltip.visible = false
		
	if Input.is_action_just_pressed("interact"):
		start_dialogue()

func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		finish()

func finish():
	queue_free()
