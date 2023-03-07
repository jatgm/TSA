extends Area2D

signal damage_taken

func take_damage():
	damage_taken.emit()
