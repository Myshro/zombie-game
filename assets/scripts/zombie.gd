extends CharacterBody2D

@onready var player := get_tree().get_root().get_node("TileMap/Player") 
#@export var player : Node2D
@export var corpse : PackedScene
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

@export var acc : float = 10
@export var speed : float = 0
@export var health_comp : HealthComp


func _ready() -> void:
	speed = player.speed * 1.10

func make_path() -> void:
	nav_agent.target_position = player.global_position

func _physics_process(_delta) -> void:
#	shuffle()
	navigate()
	handle_die()
	
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

func handle_die():
	if (health_comp.health <= 0):
		var new_corpse := corpse.instantiate() 
		get_tree().root.add_child(new_corpse)
		new_corpse.position = self.global_position
		queue_free()
