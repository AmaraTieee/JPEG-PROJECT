#MessageBus gd
extends Node

signal timbit_eaten #Global signal
signal donut_eaten
signal friend1_found
signal friend2_found
signal friend3_found
signal friend4_found

func announce_timbit_eaten():
	emit_signal("timbit_eaten")

func announce_donut_eaten():
	emit_signal("donut_eaten")
	
func announce_friend1_found():
	emit_signal("friend1_found")
	
func announce_friend2_found():
	emit_signal("friend2_found")
	
func announce_friend3_found():
	emit_signal("friend3_found")
	
func announce_friend4_found():
	emit_signal("friend4_found")
	
