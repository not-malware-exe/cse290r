extends Character

func _process(delta: float) -> void:
	super(delta)
	var target_player : Node2D = get_tree().get_nodes_in_group("Player")[0]
	var direction : Vector2 = (target_player.global_position - global_position).normalized()
	impulse = acceleration * direction * delta
	
	super(delta)
	velocity += impulse
	
