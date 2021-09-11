extends KinematicBody2D

export (int) var speed = 300


var velocity = Vector2()


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		$animation.play("walking_right")
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		$animation.play("walking_left")
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		$animation.play("standing_up")
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		$animation.play("standing_up")
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
