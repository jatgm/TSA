extends CanvasLayer

@export_file("*.json") var scene_file_text
@onready var background = $Background
@onready var text_label = $TextLabel

var scene_text = {}
var selected_text = []
var in_progress = false

func _ready():
	background.visible = true
	scene_text = load_scene_text()
	
func load_scene_text():
	var file = File.new()
	if file.file_exists(scene_file_text):
		file.open(scene_file_text, File.READ)
		return JSON.parse_string(file.get_as_text())
		
func show_text():
	text_label.text = selected_text.pop_front()

func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()
		
func finish():
	text_label.text = ""
	background.visible = false
	in_progress = false
	get_tree().paused = false
		
func start_dialogue(text_key):
	if in_progress:
		next_line()
	else:
		get_tree().paused = true
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		show_text()
