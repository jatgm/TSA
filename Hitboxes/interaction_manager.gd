extends Area2D

class_name InteractionManager

var current_interaction : InteractionManager # this var will be another interactionmanager

func initiate_interaction() -> void:
	if current_interaction != null:
		current_interaction.recieve_interaction($"../../")
		# run the "recieve_interaction()" func on the InteractionManager it's interacting with

func recieve_interaction(interacter) -> void:
	$DialogPlayer.start_dialogue()
	
func exit_bound() -> void: # These two can be overriden 
	$DialogPlayer.finish()

func hover() -> void:
	pass
	
func unhover() -> void:
	pass
	
func enter_bound(interacter) -> void:
	pass
	
func _on_interaction_manager_area_entered(area):
	current_interaction = area
	hover()
	
func _on_interaction_manager_area_exited(area):
	if current_interaction == area:
		current_interaction = null
	unhover()

func _on_bound_area_exited(_area):
	current_interaction = null
	exit_bound()

func _on_bound_area_entered(area):
	enter_bound(area)
