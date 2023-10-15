extends Node2D

class_name Bullet

@export var speed :float = 100

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Bullet_body_entered(body):
	if(body.name == "zombie"):
		#zombie takes damage
		pass
	queue_free()

