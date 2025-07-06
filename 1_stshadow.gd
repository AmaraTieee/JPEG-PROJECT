extends Sprite2D


func start(pos):
	position = pos
	show()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.timbit_eaten.connect(_on_timbit_eaten)
	

func _on_timbit_eaten():
	hide()
