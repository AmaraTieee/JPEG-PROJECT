extends Sprite2D


#resets timbit at start
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready() -> void:
	position = Vector2(629,486)
	Messenger.donut_eaten.connect(_on_donut_eaten)
	
func _on_donut_eaten():
	position = Vector2(0,0)
	hide()
