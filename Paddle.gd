extends KinematicBody2D

export var speed = 600

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("p1_down"):
		velocity.y += 1
	if Input.is_action_pressed("p1_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
