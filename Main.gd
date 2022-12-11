extends Node2D

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and $KickoffUI.visible:
		game_start()
		
func game_start():
	$KickoffUI.hide()
	$Enviornment/Player1Score.text = str(Vars.P1Score)
	$Enviornment/Player2Score.text = str(Vars.P2Score)
	$Message/MessageLabel.hide()
	yield(get_tree().create_timer(1), "timeout")
	var coinflipx = [500, -500]
	var rand_value_x = coinflipx[randi() % coinflipx.size()]
	var coinflip_y = rand_range(-200, 200)
	Vars.velocity = Vector2(rand_value_x, coinflip_y)
	
func game_end(player_name): #TODO: Determin the winner and end the game
	$KickoffUI.show()
	show_message(player_name)
	Vars.P1Score = 0
	Vars.P2Score = 0
	

func _on_Player1Net_body_entered(_body: Node) -> void:
	$Enviornment/score.play()
	Vars.P2Score += 1
	$Enviornment/Player2Score.text = str(Vars.P2Score)
	$KickoffUI.show()
	Vars.velocity = Vector2(0, 0)
	$Ball.position = Vector2(950, 420)
	check_winner()
	
func _on_Player2Net_body_entered(_body: Node) -> void:
	$Enviornment/score.play()
	Vars.P1Score += 1
	$Enviornment/Player1Score.text = str(Vars.P1Score)
	$KickoffUI.show()
	Vars.velocity = Vector2(0, 0)
	$Ball.position = Vector2(950, 420)
	check_winner()
	
func check_winner():
	if Vars.P1Score == 7:
		game_end("Player 1 wins!")
	elif Vars.P2Score == 7:
		game_end("Player 2 wins!")

func show_message(message):
	$Message/MessageLabel.text = message
	$Message/MessageLabel.show()
