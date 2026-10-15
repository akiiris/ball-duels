class_name Ball
extends CharacterBody2D

var speed: float = 4.0
var health: int = 100

var movement_vector: Vector2

func _ready() -> void:
	movement_vector = Vector2(4,5).normalized()
	movement_vector *= speed
	
	update_health_text()


func _physics_process(delta: float) -> void:
	var collision_info: KinematicCollision2D = move_and_collide(movement_vector)
	if collision_info:
		movement_vector = movement_vector.bounce(collision_info.get_normal())
		var collider = collision_info.get_collider()
		if collider is Ball:
			ball_collision(collider)


func ball_collision(other_ball: Ball):
	pass


func update_health_text() -> void:
	$HealthLabel.text = str(health)


func receive_hit(dmg: int) -> void:
	health -= dmg
	update_health_text()
