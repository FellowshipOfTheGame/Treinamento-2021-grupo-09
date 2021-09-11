extends Sprite

const VELOCITY: float = -10.0
const loopsNumber: int = 5
var g_texture_height: float = 0
var count: int = 0

func _ready():
	g_texture_height = texture.get_size().y * scale.y
	
func _process(delta: float) -> void:
	position.y += VELOCITY
	if count < loopsNumber:
		_attempt_reposition()
		count += 1
	
	
func _attempt_reposition() -> void:
	if position.y < -g_texture_height:
		# serve para não ter espaço entre as transições do background
		position.y += 2 * g_texture_height

