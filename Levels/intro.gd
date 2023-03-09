extends Node2D

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.

	
	
func play_car_animation():
	$Car/AnimationPlayer.play("car_animation")


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			animation_player.play('Intro')
