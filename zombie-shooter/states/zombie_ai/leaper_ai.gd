extends ZombieAI
class_name LeaperAI

@export var dash_module : DashModule = null

func do_state(delta: float) -> void:
	super(delta)
	if zombie == null: return
	if target == null: return
	
	var direction = ((target.global_position + target.velocity) - zombie.global_position).normalized()
	var distance_from_target = (target.global_position - zombie.global_position).length()
	if distance_from_target < 250 && distance_from_target > 40: dash_module.attempt_dash(direction)
