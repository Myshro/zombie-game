extends CharacterBody2D

class_name Player

@export var speed := 100
@export var acc := 10
func _physics_process(_delta):
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = move_toward(velocity.x, speed * input_direction.x, acc) 
	velocity.y = move_toward(velocity.y, speed * input_direction.y, acc) 
	move_and_slide()
