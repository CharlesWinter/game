extends Area2D

var speed = 400
var jitter_distance = 1
var screen_size
var target_coords
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	call_deferred("_init_position")
	
func _init_position():
	target_coords = position
	
func _process(delta):
	_move_player(delta)

		
func _move_player(delta):
		# calculate the movement vector
	var direction = Vector2()
	direction.x = target_coords.x - position.x
	direction.y = target_coords.y - position.y

	# guard against jitter when close enough
#	if direction.x < jitter_distance && direction.y < jitter_distance:
#		$AnimatedSprite.stop()
#		return
#	else:
#		pass
		
	var velocity = direction.normalized() * speed	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play("move")
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	
func _input(event):
	if event is InputEventMouseButton:
		target_coords = event.position	

