extends KinematicBody2D

func _ready() -> void:
	pass

func _physics_process(delta):
	var collision_info = move_and_collide(Vars.velocity * delta)
	if collision_info:
		Vars.velocity = Vars.velocity.bounce(collision_info.normal)
		Vars.velocity = Vars.velocity * 1.05
		$bounce.play()
