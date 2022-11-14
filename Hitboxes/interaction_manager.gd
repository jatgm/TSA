extends Area2D

class_name InteractionManager

var current_interaction : InteractionManager

func initiate_interaction() -> void:
	if current_interaction != null:
		current_interaction.recieve_interaction()

func recieve_interaction() -> void:
	print("no interacti0on defined")

func _on_interaction_manager_area_entered(area):
	current_interaction = area
	
func _on_interaction_manager_area_exited(area):
	if current_interaction == area:
		current_interaction = null
