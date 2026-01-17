extends ZombieAI
class_name GunnerAI

@export var gun : Gun = null

func do_state(delta: float) -> void:
	super(delta)
	if zombie == null: return
	if target == null: return
	
	var distance_from_target = (target.global_position - zombie.global_position).length()
	if distance_from_target < 300: 
		zombie.acceleration = -((250 - distance_from_target) * 2)
		gun.activate(target.global_position)
	else:
		zombie.acceleration = 500
