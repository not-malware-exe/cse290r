extends Character

@export var dash_module : DashModule = null

func _process(delta : float):
	super(delta)
	
	var direction : Vector2 = Input.get_vector("Left","Right","Up","Down")
	impulse = acceleration * direction * delta
	if Input.is_action_just_pressed("Dash"): dash_module.attempt_dash(direction)
