extends AnimatableBody2D

@export var move_distance = 200.0
@export var move_speed = 100.0
@export var direction = Vector2.RIGHT

var start_position: Vector2
var target_position: Vector2
var moving_forward = true

func _ready():
	start_position = global_position
	target_position = start_position + direction.normalized() * move_distance
	# Enable sync to physics for better player interaction
	sync_to_physics = true

func _physics_process(_delta):
	var distance_to_target = global_position.distance_to(target_position if moving_forward else start_position)
	
	if distance_to_target < 5.0:  # Increased threshold for smoother movement
		moving_forward = !moving_forward
	
	var current_target = target_position if moving_forward else start_position
	var move_direction = (current_target - global_position).normalized()
	
	# Use velocity for smoother platform movement
	var velocity = move_direction * move_speed
	
	# Move using the constant linear velocity for better physics
	constant_linear_velocity = velocity
