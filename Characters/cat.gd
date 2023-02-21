extends CharacterBody2D

@export var move_speed : float = 140
@export var starting_direction : Vector2 = Vector2(0, 1)
@export var moving: bool = true

#when script starts we get this var
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var sprite_2d = $Sprite2d
@onready var interaction_manager = $HitboxPivot/InteractionManager
@onready var state_machine = animation_tree.get("parameters/playback")


func _physics_process(_delta): # happens 60 times a sec, underscore can represent unused variable
	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction.normalized() * move_speed

	#built in function for characterbody new godot 4! :D
	if moving:
		move_and_slide()
		update_animation_parameters(input_direction)
		print("ba")
	else:
		sprite_2d.frame = 2
	
	if Input.is_action_just_pressed("interact"):
		interaction_manager.initiate_interaction()
	
	
func update_animation_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:

		animation_tree.set("parameters/walk/blend_position", move_input)

	if velocity != Vector2.ZERO:
		state_machine.travel("walk")
	else:
		state_machine.travel("blinking")

	

	

		

	
		
		
		
