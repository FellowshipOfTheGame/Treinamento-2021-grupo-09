extends Area2D

export (int) var speed = 400
var velocity = Vector2()
var screensize

signal hit

func _ready():
	hide()
	screensize = get_viewport_rect().size
	



func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "walking_right"
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "walking_left"
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.animation = "standing_up"
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.animation = "standing_up"
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "standing_up"
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	call_deferred("set_monitoring", false)
	
func start(pos):
	position = pos
	show()
	monitoring = true

