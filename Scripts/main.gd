extends Node2D


# Declare member variables here. Examples:
export (PackedScene) var peixeAbissal
var score


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$ScoreTimer.stop()
	$AbissaTimer.stop()
	

func new_game():
	score = 0
	#$player.start($StartPosition.position)
	$StartTimer.start()
		

func _on_AbissalTimer_timeout():
	$abissalPath/abissalSpawnLocation.offset = randi()
	var peixe = peixeAbissal.instance()
	add_child(peixe)
	var direction = $abissalPath/abissalSpawnLocation.rotation + PI/2
	peixe.position = $abissalPath/abissalSpawnLocation.position
	peixe.linear_velocity = Vector2(rand_range(peixe.min_speed, peixe.max_speed), 0)
	


func _on_ScoreTimer_timeout():
	score += 1


func _on_StartTimer_timeout():
	$AbissalTimer.start()
	$ScoreTimer.start()
	
