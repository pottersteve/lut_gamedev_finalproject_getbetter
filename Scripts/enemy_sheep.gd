extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _navigation_agent: NavigationAgent2D = $NavigationAgent2D

var SPEED = 100
var player: Node2D 

func _ready() -> void:
	
	set_physics_process(false)
	call_deferred("wait_for_physics")
	
func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	_animated_sprite.play("flying")
	
	if player:
		_navigation_agent.target_position = player.global_position
		velocity = global_position.direction_to(_navigation_agent.get_next_path_position()) * SPEED
		move_and_slide()
