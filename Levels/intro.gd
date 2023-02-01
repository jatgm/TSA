extends Node2D

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play('Intro')

func _process(_delta):
	print(Engine.get_frames_per_second())
