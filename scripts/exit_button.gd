extends Area2D

@export var next_level_path = "res://scenes/levels/level_2.tscn"

func _on_body_entered(body):
	if body.name == "Player":
		# Level complete!
		level_complete()

func level_complete():
	# Find the GameUI and show completion screen
	var game_ui = get_tree().get_first_node_in_group("game_ui")
	if game_ui and game_ui.has_method("show_completion_screen"):
		game_ui.show_completion_screen()
	else:
		# Fallback if UI not found
		load_next_level()

func load_next_level():
	# Check if next level exists, otherwise show victory message
	if ResourceLoader.exists(next_level_path):
		get_tree().change_scene_to_file(next_level_path)
	else:
		print("You won! No more levels available.")
		# Could show a victory screen here
