extends Node2D

@export var rotation_speed = 2.0
@export var damage = 30
@export var damage_cooldown_ms = 1000  # 1 second between damage ticks

var damaged_bodies = {}  # Track damage cooldown per body

func _process(delta):
	rotation += rotation_speed * delta

func _on_area_2d_body_entered(body):
	if body.has_method("take_damage"):
		apply_damage(body)

func apply_damage(body):
	# Check if enough time has passed since last damage
	var current_time = Time.get_ticks_msec()
	if damaged_bodies.has(body):
		if current_time - damaged_bodies[body] < damage_cooldown_ms:
			return  # Still in cooldown
	
	body.take_damage(damage)
	damaged_bodies[body] = current_time

func _on_area_2d_body_exited(body):
	# Clean up tracking when body leaves
	if damaged_bodies.has(body):
		damaged_bodies.erase(body)
