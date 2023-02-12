extends DialogPlayer

func _process(_delta):
	if char_count <= text_label.visible_characters:
		line_finished = true
		
	if Input.is_action_just_pressed("interact"):
		print("test")
		start_dialogue()

func finish():
	queue_free()
