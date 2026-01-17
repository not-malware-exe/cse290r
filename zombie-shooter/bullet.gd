extends Node2D
class_name Bullet

@export var direction : Vector2 = Vector2.UP
@export var damage : float =  50

func _process(delta: float) -> void:
	position += direction * 1000.0 * delta 

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	if body is Character:
		body.damage(damage)


func _on_despawn_timer_timeout() -> void:
	queue_free()
