extends State
class_name ZombieAI

var zombie : Character = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	if entered_parent is Character: 
		zombie = entered_parent
	else: return

@export var claw : ClawWeapon = null

var target : Character = null
func do_state(delta: float) -> void:
	if zombie == null: return
	
	get_target()
	if target == null: return
	var direction = ((target.global_position) - zombie.global_position).normalized()
	zombie.impulse += zombie.acceleration * direction * delta
	
	var distance_from_target = (target.global_position - zombie.global_position).length()
	if distance_from_target < 100: claw.activate(target.global_position)
	

func get_target():
	var possible_targets = get_tree().get_nodes_in_group("Player")
	if possible_targets.size() == 0: return
	target = possible_targets[0]
