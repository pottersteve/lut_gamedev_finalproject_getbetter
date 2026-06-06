extends Marker2D

@export var enemy_scene: PackedScene
@export var player_node: Node2D # <-- NEW: We will assign the player here in the editor
@export var spawn_interval_frames: int = 240
@export var spawn_amount: int = 1
@export var spawn_spread: float = 2.0

var current_frame: int = 0

func _physics_process(_delta: float) -> void:
	current_frame += 1
	if current_frame >= spawn_interval_frames:
		spawn_enemies()
		current_frame = 0

func spawn_enemies() -> void:
	if not enemy_scene:
		push_warning("Enemy scene is not assigned to the Marker2D spawner!")
		return
		
	if not player_node:
		push_warning("Player node is not assigned to the Marker2D spawner!")
		return
		
	for i in range(spawn_amount):
		var enemy_instance = enemy_scene.instantiate() as CharacterBody2D
		
		# <-- NEW: Hand the player reference directly to the newly spawned enemy
		enemy_instance.player = player_node 
		
		get_tree().current_scene.add_child(enemy_instance)
		
		var random_offset = Vector2(
			randf_range(-spawn_spread, spawn_spread), 
			randf_range(-spawn_spread, spawn_spread)
		)
		enemy_instance.global_position = global_position + random_offset
