extends CharacterBody3D

@export var speed: float = 5.0

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("move_back"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	direction.y = 0  # prevent vertical movement
	direction = direction.normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	move_and_slide()
