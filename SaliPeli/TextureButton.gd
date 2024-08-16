extends TextureButton

@onready var animation_player = $"../Ukkeli Salilla/AnimationPlayer"
@onready var ukkeli_salilla = $"../Ukkeli Salilla"

signal double_click

var double_speed:int = 1000*0.25
var last_click = 0.0

func double_click_detect()->bool:
	var new_click: = Time.get_ticks_msec()
	if new_click - last_click <= double_speed: 
			return true
	last_click = new_click
	return false
	
func _ready()->void:
	#connect("pressed", self, "on_pressed")
	#("double_click", self, "on_double_click") 
	pass

func _on_button_pressed():
	if double_click_detect():
		emit_signal("double_click")
		
#func on_pressed()->void:
	#if double_click_detect("TextureButton"):
		#emit_signal("double_click")

#func on_double_click()->void:
	#animation_player.play("Sali2")

