extends Sprite

var VELOCITY: float = -2.5
var g_texture_height: float = 0

func _ready():
	g_texture_height = texture.get_size().y * scale.y
	print(g_texture_height)
	pass

func _process(delta: float) -> void:
	position.y += VELOCITY
	attempt_reposition()
	
	
func attempt_reposition() -> void:
	if position.y < 0.5 * -g_texture_height:
		# serve para não ter espaço entre as transições do background
		position.y += 2 * g_texture_height
