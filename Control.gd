extends Control
@onready var Vbox = $UII/VBoxContainer
@onready var color = $ColorRect
@onready var väli = $"../Points Text/Label"
signal gameover

func show_gameover():
	$VBoxContainer.show()
	$ColorRect.show()

func _on_button_pressed():
	
	emit_signal("gameover")
	get_tree().reload_current_scene()
	Vbox.hide()
	color.hide()
	

func _on_timo_timeout():
	Vbox.show()
	color.show()
	väli.hide()
