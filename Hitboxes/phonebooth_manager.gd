extends InteractionManager

var lerp_timer = 0.0
var player = null

func hover() -> void:
	$Sprite2d.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Sprite2d.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void: # open the phonebooth UI
	player = interacter
	lerp_timer = 0.2

func _process(delta):
	if lerp_timer > 0.0 and player != null:
		player.position = player.position.lerp($"../".position, 5*delta)
		lerp_timer -= delta
		print(lerp_timer)
