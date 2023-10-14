extends CharacterBody2D

@onready var player := get_tree().get_root().get_node("main/Player")
@export var acc : float = 10

func _physics_process(_delta) -> void:
	move_toward(velocity.x, player.x, acc)
	move_and_slide()
func shuffle():
	look_at(player.location)
