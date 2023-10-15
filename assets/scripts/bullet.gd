extends Node2D

class_name Bullet

@export var speed :float = 100

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_body_entered(body):
	if(body.name == "Zombie"):
		print("hit zombiona")
		#zombie takes damage
		body.health_comp.take_damage(1)
		pass
	queue_free()
