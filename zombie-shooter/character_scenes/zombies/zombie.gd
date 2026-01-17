#extends Character
#
#var chase_type : int = 1
#
#
#func _process(delta: float) -> void:
	#super(delta)
	#var direction : Vector2 = Vector2.ZERO
	#match chase_type:
		#1:
			#direction = (target_player.global_position - global_position).normalized()
			#
		#2:
			#direction = ((target_player.global_position + target_player.velocity + target_player.impulse*target_player.impulse) - global_position).normalized()
		#3:
			#direction = ((target_player.global_position + target_player.impulse*target_player.impulse) - global_position).normalized()
		#4:
			#direction = ((target_player.global_position + target_player.velocity + target_player.impulse*target_player.impulse) - global_position).normalized()
	#impulse = acceleration * direction * delta
	#
	#super(delta)
	#velocity += impulse
	#var distance_from_target = (target_player.global_position - global_position).length()
	#if distance_from_target < 250 && distance_from_target > 40: dash_module.attempt_dash(direction)
	#
