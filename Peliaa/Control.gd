extends Control

@onready var Vbox = $UII/VBoxContainer
@onready var color = $ColorRect
@onready var väli = $"../Points Text/Label"
@onready var kirjoitusteksti = $LineEdit
@onready var label = $Label
@onready var nimi = "Vieras"

signal gameover
signal new_text

func show_gameover():
	$VBoxContainer.show()
	$ColorRect.show()
	$label.show()
	$LineEdit.show()

func _on_button_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	Vbox.hide()
	color.hide()
	_tulos()

func _on_timo_timeout(): 
	color.show()
	väli.hide()
	label.show()
	Vbox.show()
	kirjoitusteksti.show()
	print(nimi)
	
func _tulos():
	Leaderboards.post_guest_score("ilikkansali-high-score-OR0q", Global.score, str(nimi))

func _on_line_edit_text_changed(new_text):
	nimi = new_text
