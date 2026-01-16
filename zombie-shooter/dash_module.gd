extends Node
class_name DashModule

@export var dash_impulse : float = 240
var can_dash : bool = true
@export var dash_timer : Timer = Timer.new()
@export var dash_energy_cost : float = 20.0

var character : Character = null

func _ready():
	var parent = get_parent()
	if parent is Character: character = parent
	else: return
	dash_timer.timeout.connect(dash_time_out)

func attempt_dash(direction : Vector2):
	if !can_dash or character.energy < dash_energy_cost: return
	dash_timer.start()
	can_dash = false
	character.impulse += direction * dash_impulse
	character.energy -= dash_energy_cost

func dash_time_out():
	can_dash = true
