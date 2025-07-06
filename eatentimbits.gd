extends StaticBody2D

func start(pos):
	position = pos
	hide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.timbit_eaten.connect(_on_timbit_eaten)
	

func _on_timbit_eaten():
	show()#for 3 seconds
