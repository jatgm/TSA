extends Sprite2D

@onready var light = $PointLight2d

# Called when the node enters the scene tree for the first time.
func _ready():
	while true:
		await get_tree().create_timer(randf_range(0,2)).timeout
		light.energy = randf_range(0, 0.35)
		await get_tree().create_timer(randf_range(0,1)).timeout
		light.energy = 0.35


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
