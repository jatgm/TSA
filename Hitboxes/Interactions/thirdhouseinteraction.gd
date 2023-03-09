extends InteractionManager

var text = ""

func hover() -> void:
	$House3.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$House3.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void:
	if interacter.step == 5:
		$CanvasLayer.visible = true

func _on_line_edit_text_changed(new_text):
	text = new_text

func _on_button_pressed():
	if text == "TCSKHSSDQ":
		$Node2D/CanvasLayer.visible = true
		
