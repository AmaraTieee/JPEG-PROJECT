extends Sprite2D


#resets timbit at start

func _ready() -> void:
	Messenger.donut_eaten.connect(_on_donut_eaten)
	visible = false
	
func _on_donut_eaten():
	visible = true
	$Timer.start(2.0) #show 2 sec
	
func _on_timer_timeout():
	visible = false #hide after time elapses
