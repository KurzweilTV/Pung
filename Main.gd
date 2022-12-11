extends Node2D

func _ready() -> void:
	randomize()
	
func game_start():
	$KickoffUI.hide()
	yield(get_tree().create_timer(1), "timeout")
	var coinflipx = [500, -500]
	var rand_value_x = coinflipx[randi() % coinflipx.size()]
	var coinflip_y = rand_range(-200, 200)
	print(coinflip_y)
	Vars.velocity = Vector2(rand_value_x, coinflip_y)	

func _on_Player1Net_body_entered(body: Node) -> void:
	$Enviornment/score.play()
	Vars.P2Score += 1
	$Enviornment/Player2Score.text = str(Vars.P2Score)
	$KickoffUI.show()
	Vars.velocity = Vector2(0, 0)
	$Ball.position = Vector2(950, 420)
	
func _on_Player2Net_body_entered(body: Node) -> void:
	$Enviornment/score.play()
	Vars.P1Score += 1
	$Enviornment/Player1Score.text = str(Vars.P1Score)
	$KickoffUI.show()
	Vars.velocity = Vector2(0, 0)
	$Ball.position = Vector2(950, 420)
