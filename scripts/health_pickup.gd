extends Area2D

@export var health_amount = 25

func _on_body_entered(body):
	if body.has_method("heal"):
		body.heal(health_amount)
		queue_free()
