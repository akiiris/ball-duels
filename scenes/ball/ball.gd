class_name Ball
extends RigidBody2D

var speed: float = 300.0
var health: int = 100

var ball_collision: bool = false

var movement_vector: Vector2
var ball_col_new_dir: Vector2

func _ready() -> void:
	movement_vector = Vector2(randi_range(-100,100),randi_range(-100,100)).normalized()
	#apply_central_impulse(movement_vector * speed)
	linear_velocity = movement_vector * speed
	
	update_health_text()


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if ball_collision:
		ball_collision = false
		linear_velocity = ball_col_new_dir * speed


func update_health_text() -> void:
	$HealthLabel.text = str(health)


func receive_hit(dmg: int) -> void:
	health -= dmg
	update_health_text()


func _on_body_entered(body: Node) -> void:
	if body is Ball:
		ball_col_new_dir = (global_position - body.global_position).normalized()
		ball_collision = true
