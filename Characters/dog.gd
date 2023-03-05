extends CharacterBody2D

@onready var camera = $"../Camera2d"
@onready var remote_transform = $"../cat/RemoteTransform2D"
@onready var cat = $"../cat"
@onready var sprite = $InteractionManager/dog_sprite

@export var backup_dog = false

var tracking = false
var antecendant = false
var lerp_intensity = 15
var chasing = false

func transform():
	sprite.play("head")
	chasing = true

func _physics_process(delta):
	if not backup_dog:
		if tracking:
			camera.position = camera.position.lerp(Vector2((cat.position.x + position.x)/2, (cat.position.y + position.y)/2), 5*delta)
		if not tracking and antecendant:
			camera.position = camera.position.lerp(cat.position, lerp_intensity*delta)
			if camera.position.distance_to(cat.position) < 4:
				camera.code_based_tracking = !false
				remote_transform.update_position = !false
				
	if chasing:
		velocity = round(position.direction_to(cat.position)) * 50
		update_animation_parameters(position.direction_to(cat.position))

		move_and_slide()	
			
func _on_interaction_manager_start(interacter):
	
	if not tracking:
		if not backup_dog:
			camera.code_based_tracking = false
			remote_transform.update_position = false
			tracking = true
			antecendant = true
			var tween = get_tree().create_tween()
			tween.tween_property(camera, "zoom", Vector2(4.5,4.5), 0.5)

func _on_interaction_manager_leave():
	if not backup_dog:
		tracking = !true
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", Vector2(4,4), 0.7)

func update_animation_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:
		if abs(move_input.x) > .5:
			if move_input > Vector2(0.1,0):
				$AnimationPlayer.play("move right")
			if move_input < Vector2(-0.1,0):
				$AnimationPlayer.play("move left")
		else:
			if move_input.y > 0.1:
				$AnimationPlayer.play("move down")
			if move_input.y < -0.1:
				$AnimationPlayer.play("move up")

