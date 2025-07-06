extends RigidBody2D


#resets timbit at start
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready() -> void:
	Messenger.friend3_found.connect(_on_friend3_found)
	
func _on_friend3_found():
	show()
