extends Node2D
class_name ClawWeapon

@onready var area : Area2D = $Area2D
@onready var swipe_timer : Timer = $SwipeTimer
@onready var cooldown_timer : Timer = $CooldownTimer

func _ready():
	swipe_timer.timeout.connect(swipe_timeout)
	cooldown_timer.timeout.connect(cooldown_timeout)

var cooling_down : bool = false
func activate(target_position : Vector2):
	if cooling_down: return
	cooling_down = true
	look_at(target_position)
	area.monitoring = true
	area.visible = true
	swipe_timer.start()
	cooldown_timer.start()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Character:
		
		body.damage(10)
		
	


func swipe_timeout() -> void:
	
	area.monitoring = false
	area.visible = false
	

func cooldown_timeout() -> void:
	
	cooling_down = false
	
