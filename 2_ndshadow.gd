extends Sprite2D


func start(pos):
	position = pos
	show()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.donut_eaten.connect(_on_donut_eaten)
	

func _on_donut_eaten():
	show()
