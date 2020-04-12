extends Area2D

var speed : = 400.0
#var jitter_distance = 1
#var screen_size
#var target_coords

var path : = PoolVector2Array() setget set_path

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	var move_distance : = speed * delta
	move_along_path(move_distance)
	
func move_along_path(distance: float) -> void:
	var start_point : = position
	
	for i in range(path.size()):
		var distance_to_next_point : = start_point.distance_to(path[0])
		if distance <= distance_to_next_point and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next_point)
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
		distance -= distance_to_next_point
		start_point = path[0]
		path.remove(0)

# setters are set right at the start of a load
func set_path(value: PoolVector2Array) -> void:
	path = value
	if path.size() == 0:
		return
	set_process(true)
	

# Called when the node enters the scene tree for the first time.
#func _ready():
#	screen_size = get_viewport_rect().size
#	call_deferred("_init_position")
#
#func _init_position():
#	target_coords = position
#
#func _process(delta):
#	_move_player(delta)
#
#
#func _move_player(delta):
#		# calculate the movement vector
#	var direction = Vector2()
#	direction.x = target_coords.x - position.x
#	direction.y = target_coords.y - position.y
#
#	# guard against jitter when close enough
##	if direction.x < jitter_distance && direction.y < jitter_distance:
##		$AnimatedSprite.stop()
##		return
##	else:
##		pass
#
#	var velocity = direction.normalized() * speed	
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#		$AnimatedSprite.play("move")
#	else:
#		$AnimatedSprite.stop()
#
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
#
#	if velocity.x != 0:
#		$AnimatedSprite.flip_v = false
#		# See the note below about boolean assignment
#		$AnimatedSprite.flip_h = velocity.x < 0
#
#func _input(event):
#	if event is InputEventMouseButton:
#		target_coords = event.position	

