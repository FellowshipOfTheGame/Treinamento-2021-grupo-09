extends Node

export (PackedScene) var Mob
var score

func _ready():
	$Music.play()
	randomize() 

func new_game():
	score = 0
	$SoundFx.play()
	$Player.start($StartPOSITION.position)
	$StartTimer.start()
	$HUD.show_message("Get Ready!")
	$HUD.update_score(score)

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.game_over()
	$HUD.update_last_score(score)

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	$MobPath/MobSpanwLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpanwLocation.rotation
	mob.position = $MobPath/MobSpanwLocation.position
	direction += rand_range(PI/4, PI/2)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction))
