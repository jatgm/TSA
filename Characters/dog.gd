extends CharacterBody2D

@onready var camera = $"../Camera2d"
@onready var remote_transform = $"../cat/RemoteTransform2D"
@onready var cat = $"../cat"
var tracking = false

func _process(delta):
	if tracking:
		camera.position = camera.position.lerp(Vector2((cat.position.x + position.x)/2, (cat.position.y + position.y)/2), 5*delta)

func _on_interaction_manager_start(interacter):
	if not tracking:
		camera.code_based_tracking = false
		remote_transform.update_position = false
		tracking = true
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", Vector2(4.5,4.5), 0.5)

func _on_interaction_manager_leave():
	tracking = !true
	var tween = get_tree().create_tween()
	tween.tween_property(camera, "zoom", Vector2(4,4), 0.7)
	camera.code_based_tracking = !false
	remote_transform.update_position = !false
	
