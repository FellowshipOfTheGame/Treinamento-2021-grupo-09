extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Prepara")
	
	$background1A.ajusteTela()
	$background1B.ajusteTela()
	$background1A.update_velocity(-7.5)
	$background1B.update_velocity(-7.5)

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	

func _on_StartTimer_timeout():
	$ScoreTimer.start()
	
