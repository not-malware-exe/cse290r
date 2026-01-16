extends Control

@export var player : Character = null
@onready var health_bar : ProgressBar = $HealthBar
@onready var energy_bar : ProgressBar = $EnergyBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	health_bar.value = player.health
	energy_bar.value = player.energy
	
