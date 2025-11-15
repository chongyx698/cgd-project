extends Node2D

@export var shoot_interval = 2.0
@export var fireball_speed = 200.0
@export var shoot_direction = Vector2.RIGHT

var fireball_scene: PackedScene
var shoot_timer = 0.0

func _ready():
	# Load the fireball scene at runtime to avoid preload issues
	fireball_scene = load("res://scenes/hazards/fireball.tscn")
	if not fireball_scene:
		push_error("Failed to load fireball scene!")

func _process(delta):
	shoot_timer += delta
	if shoot_timer >= shoot_interval:
		shoot_fireball()
		shoot_timer = 0.0

func shoot_fireball():
	if not fireball_scene:
		return
	
	var fireball = fireball_scene.instantiate()
	fireball.global_position = global_position
	fireball.direction = shoot_direction.normalized()
	fireball.speed = fireball_speed
	get_parent().add_child(fireball)
