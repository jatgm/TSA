extends DialogPlayer

signal finish_first_time_dialog

func start_dialogue(step = null):
	if step == 0:
		scene_file_text = "res://json/first_time_inside_phonebooth.json"
		scene_text = load_scene_text()
	super.start_dialogue()
	
func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		finish()
		finish_first_time_dialog.emit()
