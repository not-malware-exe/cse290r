extends Node
class_name State

@export var enter_on_set_up : bool = false

var entered_parent : Node

@export var delay_time : float = 0.0
var active_time : float = 0.0

func _ready() -> void: 
	if enter_on_set_up:
		enter()
	else:
		process_mode = Node.PROCESS_MODE_DISABLED

func enter():
	entered_parent = get_parent()
	process_mode = Node.PROCESS_MODE_INHERIT
	

func init_parallel_state(friend : State = null):
	
	friend.enter()
	

func exit(successor : State = null):
	
	if successor: successor.enter()
	process_mode = Node.PROCESS_MODE_DISABLED
	active_time = 0.0
	

func do_state(_delta: float) -> void:
	
	pass
	

func _process(delta: float) -> void:
	
	active_time += delta
	if active_time < delay_time: return
	do_state(delta)
	
