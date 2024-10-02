extends Node2D

const SPEED = 60
var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right_corner: RayCast2D = $RayCastRightCorner
@onready var ray_cast_left_corner: RayCast2D = $RayCastLeftCorner
var gravity := 600  # Valor de la gravedad
var speed := 200
var velocity := Vector2.ZERO 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	elif ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	elif not ray_cast_right_corner.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	elif not ray_cast_left_corner.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x +=  direction * SPEED * delta
	
