extends Node2D
class_name Gun

@export var bullet_scene : PackedScene = null
@onready var gun_pivot : Node2D = $GunPivot
@onready var gun_opening : Node2D = $GunPivot/GunOpening
@onready var cooldown_timer : Timer = $CooldownTimer

func _ready():
	cooldown_timer.timeout.connect(cooldown_timeout)

var cooling_down : bool = false
func activate(target_position : Vector2):
	
	look_at(target_position)
	gun_pivot.look_at(target_position)
	if cooling_down: return
	cooling_down = true
	cooldown_timer.start()
	fire_bullet((target_position - gun_pivot.global_position).normalized())
	

func fire_bullet(direction : Vector2):
	
	var new_bullet : Bullet = bullet_scene.instantiate()
	Globals.world.add_child(new_bullet)
	new_bullet.global_position = gun_opening.global_position
	new_bullet.direction = direction
	

func cooldown_timeout() -> void:
	
	cooling_down = false
	
