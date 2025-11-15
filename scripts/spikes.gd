extends Area2D

@export var damage = 35
@export var damage_cooldown_ms = 1000  # 1 second between damage ticks

var damaged_bodies = {}  # Track damage cooldown per body

func _on_body_entered(body):
	if body.has_method("take_damage"):
		apply_damage(body)

func _physics_process(_delta):
	# Check bodies currently overlapping and apply damage with cooldown
	for body in get_overlapping_bodies():
		if body.has_method("take_damage"):
			apply_damage(body)

func apply_damage(body):
	var current_time = Time.get_ticks_msec()
	if damaged_bodies.has(body):
		if current_time - damaged_bodies[body] < damage_cooldown_ms:
			return  # Still in cooldown
	
	body.take_damage(damage)
	damaged_bodies[body] = current_time

func _on_body_exited(body):
	# Clean up tracking when body leaves
	if damaged_bodies.has(body):
		damaged_bodies.erase(body)
