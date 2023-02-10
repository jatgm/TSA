extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var dialog_player = $DialogPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play('Intro')
	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		dialog_player.start_dialogue()
