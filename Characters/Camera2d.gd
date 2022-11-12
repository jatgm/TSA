extends Camera2D

@onready var animation_player = $AnimationPlayer

func _on_player_cat_is_sprinting():

	animation_player.play("sprint")

func _on_player_cat_stop_sprinting():
	
	animation_player.play("sprintstop")



