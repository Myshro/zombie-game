extends CharacterBody2D

#@onready var player := get_tree().get_root().get_node("andrew_test/Player") 
@export var player : Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

@export var acc : float = 10
@export var speed : float = 0
@export var health_comp : HealthComp


func _ready() -> void:
	speed = player.speed * 0.75

func make_path() -> void:
	nav_agent.target_position = player.global_position

func _physics_process(_delta) -> void:
#	shuffle()
	navigate()
	
#func shuffle() -> void:
#	velocity = get_global_transform().basis_xform(Vector2.RIGHT) * speed 
#	move_and_slide()
#	look_at(player.position)
	
func navigate():
	var direction := to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()
	
func _on_timer_timeout():
	make_path()
