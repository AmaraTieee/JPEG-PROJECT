extends Sprite2D


#resets timbit at start

func _ready() -> void:
	Messenger.timbit_eaten.connect(_on_timbit_eaten)
	self.visible = false
	
func _on_timbit_eaten():
	visible = true
	$Timer.start(2.0) #show 2 sec
	
func _on_Timer_timeout():
	visible = false #hide after time elapses
