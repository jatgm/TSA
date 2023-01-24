extends Sprite2D

@onready var light = $PointLight2d

enum LIGHT_STATE {ON,OFF}

var state = LIGHT_STATE.ON

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func light_flicker():
	state = LIGHT_STATE.ON
	while state == LIGHT_STATE.ON:
		await get_tree().create_timer(randf_range(0,2)).timeout
		light.energy = randf_range(0, 0.35)
		await get_tree().create_timer(randf_range(0,1)).timeout
		light.energy = 0.35
	print("fart")
	light.energy = 0

func light_off():
	state = LIGHT_STATE.OFF

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
