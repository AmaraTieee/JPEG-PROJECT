#MessageBus gd
extends Node

signal timbit_eaten #Global signal
signal donut_eaten

func announce_timbit_eaten():
	emit_signal("timbit_eaten")

func announce_donut_eaten():
	emit_signal("donut_eaten")
