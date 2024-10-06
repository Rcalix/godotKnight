extends CharacterBody2D

const SPEED = 60
var direction = 1
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_floor_left: RayCast2D = $RayCastFloorLeft
@onready var ray_cast_floor_right: RayCast2D = $RayCastFloorRight
@onready var ray_cast_short_floor_left: RayCast2D = $RayCastShortFloorLeft
@onready var ray_cast_short_floor_right: RayCast2D = $RayCastShortFloorRight

var gravity := 600

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	handle_movement()
	move_and_slide()
	check_wall_turn()

func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_movement() -> void:
	velocity.x = direction * SPEED

func check_wall_turn() -> void:
	# Revisa si hay pared enfrente o si no hay suelo en la dirección en la que va el enemigo
	if is_on_wall() or not is_on_ground_in_direction():
		direction *= -1
		animated_sprite.flip_h = direction < 0

func is_on_ground_in_direction() -> bool:
	if direction == 1:
		return ray_cast_floor_right.is_colliding() or ray_cast_short_floor_right.is_colliding()
	else:
		return ray_cast_floor_left.is_colliding() or ray_cast_floor_left.is_colliding()
