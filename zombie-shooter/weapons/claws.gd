extends Node2D

#func activate(direction : Area2D):
	#
	#
	#

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Character:
		
		body.damage(10)
		
	
