extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var texture_button = $"../TextureButton"
@onready var timerlabel = $"../TIMO/Label"
@onready var timer = $"../TIMO"
@onready var label = $"../Points Text/Points"
@onready var pisteet = 0

signal gameovertime

@onready var vaikeusaste = 1   
var timeron = false
var klick = 0

func _ready():
	label.text =str(pisteet)
	animation_player.play("Idle")
		
func _on_texture_button_pressed():
	klick += 1
	if Input.is_action_pressed("Nosto") && klick <= 1 * vaikeusaste:
		animation_player.play("Sali1")
		emit_signal("gameovertime")
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
		
func time_left_to_play():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	timerlabel.text = "%02d:%02d" % time_left_to_play()
	if timeron == false and Input.is_action_pressed("Nosto"):
		timeron = true
		timer.start()

