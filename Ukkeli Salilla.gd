extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var texture_button = $"../TextureButton"
@onready var timer = $Timer
@onready var label = $"../Points Text/Points"

@onready var pisteet = 0

@onready var vaikeusaste = 1   

var klick = 0

func _ready():
	label.text =str(pisteet)
	animation_player.play("Idle")
	
func _on_texture_button_double_click():
	if Input.is_action_just_pressed("Nosto"):
		animation_player.play("Sali2")


func _on_texture_button_pressed():
	klick += 1
	if Input.is_action_pressed("Nosto") && klick <= 1 * vaikeusaste:
		animation_player.play("Sali1")
		
	if Input.is_action_pressed("Nosto") && klick == 2 * vaikeusaste:
		animation_player.play("Sali2")
		
	if Input.is_action_pressed("Nosto") && klick == 3 * vaikeusaste:
		animation_player.play("Sali3")
	
	if Input.is_action_pressed("Nosto") && klick == 4 * vaikeusaste:
		animation_player.play("Sali4")
		
	if Input.is_action_pressed("Nosto") && klick == 5 * vaikeusaste:
		animation_player.play("Sali5")
		
	if Input.is_action_pressed("Nosto") && klick == 6 * vaikeusaste:
		klick = 0
		pisteet += 1
		vaikeusaste += 1
		label.text = "Pisteet : " + str(pisteet)
		
#func _on_timer_timeout():
	#if animation_player.play("Sali2") && timer.timer_timeout:
		#print("ajastin")
		#animation_player.play("Sali3")
