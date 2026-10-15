extends CharacterBody2D

var speed: float = 4.0
var movement_vector: Vector2

func _ready() -> void:
	movement_vector = Vector2(4,5).normalized()
	movement_vector *= speed


func _physics_process(delta: float) -> void:
	var collision_info: KinematicCollision2D = move_and_collide(movement_vector)
	if collision_info:
		movement_vector = movement_vector.bounce(collision_info.get_normal())
