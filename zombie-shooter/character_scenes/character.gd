extends CharacterBody2D
class_name Character


@export var acceleration : float = 360.0
@export var drag : float = 0.9
@export var friction : float = 60.0

@export var energy : float = 100.0
@export var health : float = 100.0



var impulse : Vector2 = Vector2.ZERO
func _process(delta: float) -> void:
	velocity -= velocity * drag * delta
	apply_friction(delta)
	velocity += impulse
	impulse = Vector2.ZERO
	energy = min(energy + delta, 100.0)

func apply_friction(delta : float):
	
	for axis in 2:
		
		var flat_axis_imp = 0 if impulse[axis] == 0 else (1 if impulse[axis] > 0 else -1)
		var flat_axis_vel = 0 if velocity[axis] == 0 else (1 if velocity[axis] > 0 else -1)
		
		var can_friction : bool = ((flat_axis_imp == 0) || (flat_axis_imp != flat_axis_vel)) && (flat_axis_vel != 0)
		
		velocity[axis] -= min(abs(velocity[axis]),friction * delta) * flat_axis_vel * float(can_friction)
		
	

func _physics_process(_delta: float) -> void:
	
	move_and_slide()

func damage(amount : float):
	health -= amount
	print(health)
	if health <= 0:
		queue_free()
		print("deadaa")
