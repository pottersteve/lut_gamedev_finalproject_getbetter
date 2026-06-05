extends Button

@export var my_player: Player
var was_pressed: int = 0
var target_presses: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	target_presses = rng.randi_range(5, 15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if my_player != null:
		if my_player.awake == true:
			text = "Try sleeping"
		else:
			text = "WAKE UP"
			
			


func change_scene():
	pass


func _on_pressed() -> void:
	was_pressed += 1
	if was_pressed == target_presses:
		print("scene changed")
		change_scene()
