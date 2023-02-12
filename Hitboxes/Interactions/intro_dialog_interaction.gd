extends DialogPlayer

var paused = false

func _process(_delta):
	if char_count <= text_label.visible_characters:
		line_finished = true
		if in_progress:
			if not paused:
				$Tooltip.visible = true
	else:
		$Tooltip.visible = false
	
	if Input.is_action_just_pressed("interact"):
		if not paused and current_index != "8":
			start_dialogue()
			
	if line_finished and current_index == "8":
		$AnimationPlayer.play('Cut')

func show_text():
	line_finished = false
	text_label.visible_characters = 0
	current_index = str((current_index).to_int() + 1)
	
	if scene_text[current_index]["dialogue"] == "Pause":
		paused = true
		visible = false
		await get_tree().create_timer(5).timeout
		text_label.visible_characters = 0
		current_index = str((current_index).to_int() + 1)
		visible = true
		paused = false
	
	text_label.text = scene_text[current_index]["dialogue"]
	char_count = len(scene_text[current_index]["dialogue"])
	if scene_text[current_index]["name"] == "":
		name_background.visible = false
	else:
		name_background.visible = true
	name_label.text = scene_text[current_index]["name"]

func reveal_character():
	if not paused:
		text_label.visible_characters += 1

func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		finish()

func finish():
	queue_free()
