extends Character

@export var dash_module : DashModule = null
@export var gun : Gun = null

func _process(delta : float):
	super(delta)
	
	var direction : Vector2 = Input.get_vector("Left","Right","Up","Down")
	impulse = acceleration * direction * delta
	if Input.is_action_just_pressed("Dash"): dash_module.attempt_dash(direction)
	health += delta / 10.0
	gun.activate(get_global_mouse_position())
