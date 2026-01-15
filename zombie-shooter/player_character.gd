extends Character

var dash_impulse : float = 240

func _process(delta : float):
	
	var direction : Vector2 = Input.get_vector("Left","Right","Up","Down")
	var dashing : bool = Input.is_action_just_pressed("Dash")
	impulse = acceleration * direction * delta + dash_impulse * direction * float(dashing)
	
	super(delta)
	velocity += impulse
