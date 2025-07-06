extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.timbit_eaten.connect(_on_timbit_eaten)
	screen_size = get_viewport_rect().size

#resets player at start
func start(pos):
	position = pos
	rotation_degrees = 0
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	@warning_ignore("shadowed_variable_base_class")
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	move_and_slide()
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# diorection of player when moving
	if velocity.x != 0:
		rotation_degrees = 0 # reset angle
		$AnimatedSprite2D.animation = "walkx" # play walk cycle
		$AnimatedSprite2D.flip_h = velocity.x < 0
		if velocity.x > 0: #pos x movement
			if velocity.y !=0:
			
				if velocity.y > 0:#pos y
						rotation_degrees = 45
				if velocity.y < 0:#neg y
						rotation_degrees = -45
				else:
					$AnimatedSprite2D.flip_v = false
		if velocity.x < 0: #neg x movement = flip degree rotation (cartesian)
			if velocity.y !=0:
			
				if velocity.y > 0:#pos > neg/pos
						rotation_degrees = -45 
				if velocity.y < 0:
						rotation_degrees = 45
				else:
					$AnimatedSprite2D.flip_v = false

	elif velocity.y != 0:
		rotation_degrees = 0 # reset angle
		$AnimatedSprite2D.animation = "walky"
		$AnimatedSprite2D.flip_v = velocity.y > 0
	
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"): # E by default
		#get_tree().change_scene_to_file("res://GoodScene.tscn")
	#elif Input.is_action_just_pressed("ui_cancel"): # R by default
		#get_tree().change_scene_to_file("res://BadScene.tscn")
	#
	
#func _on_body_entered(body: Node):
	#if body.name == "timbit":
		#Messenger.emit_signal("timbit_eaten") #broadcast
		#body.queue_free() #remove timbit
		
	##if body.name == "Video Trigger":
		#var video_player = get_node("/root/Main/VideoStream")
		#video_player.play()
		
	
func _on_timbit_eaten():
	print("timbit eaten!")#do stuff
