extends CharacterBody2D

@export var speed := 100
@export var acc := 10
@export var health_comp : HealthComp

func _physics_process(_delta):
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = move_toward(velocity.x, speed * input_direction.x, acc) 
	velocity.y = move_toward(velocity.y, speed * input_direction.y, acc) 
	move_and_slide()
	look_at(get_global_mouse_position())
