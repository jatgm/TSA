extends CanvasLayer

@onready @export_file("*.json") var scene_file_text
@onready var background = $Background
@onready var text_label = $Text
@onready var name_background = $NameBackground
@onready var name_label = $NameText

var scene_text = {}
var selected_text = []
var current_index = "0"
var in_progress = false

func _ready():
	background.visible = false
	name_background.visible = false
	scene_text = load_scene_text()
	
func load_scene_text():
	var file = File.new()
	if file.file_exists(scene_file_text):
		file.open(scene_file_text, File.READ)
		return JSON.parse_string(file.get_as_text())
		
func show_text():
	current_index = str((current_index).to_int() + 1)
	text_label.text = scene_text[current_index]["dialogue"]
	if scene_text[current_index]["name"] == "":
		name_background.visible = false
	else:
		name_background.visible = true
	name_label.text = scene_text[current_index]["name"]

func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		finish()
		
func finish():
	current_index = "0"
	text_label.text = ""
	name_label.text = ""
	background.visible = false
	name_background.visible = false
	in_progress = false

	#get_tree().paused = false
		
func start_dialogue():
	if in_progress:
		next_line()
	else:
		background.visible = true
		name_background.visible = true
		in_progress = true
		print("sdfsaldfjasfidsnkfoi")
		#selected_text = scene_text[current_index]["dialogue"]
		visible = true
		show_text()
