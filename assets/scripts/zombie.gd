extends CharacterBody2D

@onready var player := get_tree().get_root().get_node("andrew_test/Player") 
@export var acc : float = 10
@export var speed : float = 0
@export var health_comp : HealthComp

func _ready() -> void:
	speed = player.speed * 0.75

func _physics_process(_delta) -> void:
	shuffle()
	
func shuffle() -> void:
	velocity = get_global_transform().basis_xform(Vector2.RIGHT) * speed 
	move_and_slide()
	look_at(player.position)
	
