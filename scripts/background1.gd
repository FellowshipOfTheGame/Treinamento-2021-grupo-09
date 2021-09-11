extends Sprite

var VELOCITY: float
const loopsNumber: int = 5
var g_texture_height: float = 0
var count: int = 0

func _ready():
	pass
	
func ajusteTela():
	g_texture_height = texture.get_size().y * scale.y
	
func update_velocity(valor):
	VELOCITY = valor

func _process(delta: float) -> void:
	position.y += VELOCITY
	attempt_reposition()
		
	
	
func attempt_reposition() -> void:
	if position.y < -g_texture_height:
		# serve para não ter espaço entre as transições do background
		position.y += 2 * g_texture_height
