extends Sprite2D


#resets timbit at start
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready() -> void:
	position = Vector2(1145,790)
	Messenger.timbit_eaten.connect(_on_timbit_eaten)
	
func _on_timbit_eaten():
	hide()
	position = Vector2(0,0)
