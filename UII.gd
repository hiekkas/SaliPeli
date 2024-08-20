extends CanvasLayer

signal Peliloppui

func show_peliloppui():
	$VBoxContainer.show()

func _on_button_pressed():
	emit_signal("Peliloppui")
	get_tree().reload_current_scene()
	$VBoxContainer.hide()
