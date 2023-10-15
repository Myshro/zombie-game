extends Area2D

var sprite: Sprite2D
var coll2D: CollisionShape2D
func _ready():
	sprite = get_node("Sprite2D")
	coll2D = get_node("CollisionShape2D")
func preview():
	sprite.modulate.a = 0.5
	
func place():
	sprite.modulate.a = 1
	coll2D.disabled = false
	
