extends State
class_name ZombieAI

var zombie : Character = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	if entered_parent is Character: 
		zombie = entered_parent
	else: return

var target : Character = null
func do_state(delta: float) -> void:
	if zombie == null: return
	
	get_target()
	var direction = ((target.global_position) - zombie.global_position).normalized()
	zombie.impulse += zombie.acceleration * direction * delta

func get_target():
	target = get_tree().get_nodes_in_group("Player")[0]
