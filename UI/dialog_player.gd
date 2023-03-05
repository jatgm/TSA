extends CanvasLayer

class_name DialogPlayer

@export_file("*.json") var scene_file_text
@onready var background = $Background
@onready var text_label = $Text
@onready var name_background = $NameBackground
@onready var name_label = $NameText

var scene_text = {}
var selected_text = []
var current_index = "0"
var char_count = 0
var in_progress = false
var line_finished = false

func _input(event):
	if event.is_action_pressed("interact"):
		continue_dialogue()
		
		
func _process(_delta):
	if char_count <= text_label.visible_characters:
		line_finished = true

func _ready():
	background.visible = false
	name_background.visible = false
	scene_text = load_scene_text()
	
func load_scene_text():
	var file = FileAccess.open(scene_file_text, FileAccess.READ)
	return JSON.parse_string(file.get_as_text())
		
func show_text():
	line_finished = false
	text_label.visible_characters = 0
	current_index = str((current_index).to_int() + 1)
	text_label.text = scene_text[current_index]["dialogue"]
	char_count = len(scene_text[current_index]["dialogue"])
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
	if not in_progress:
		get_tree().call_group("dialog_players", "finish")
		background.visible = true
		name_background.visible = true
		in_progress = true
		#selected_text = scene_text[current_index]["dialogue"]
		visible = true
		show_text()
		
func continue_dialogue():
	if in_progress:
		if line_finished:
			next_line()
		else:
			text_label.visible_characters = 999

func reveal_character():
	text_label.visible_characters += 1

func _on_timer_timeout():
	if char_count >= text_label.visible_characters:
		reveal_character()
