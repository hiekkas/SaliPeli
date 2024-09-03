extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var texture_button = $"../TextureButton"
@onready var timerlabel = $"../TIMO/Label"
@onready var timer = $"../TIMO"
@onready var Pistelabel = $"../Points Text/Points"
@onready var Scorelabel = $"../Points Text/Score"
@onready var control = $"../Control"
@onready var Painalabel = $"../Points Text/Label"


@onready var vaikeusaste = 2
@onready var pisteet = 0
@onready var tausta = $".."

var aika = false  
var timeron = false
var klick = 0
var lead = 0

signal gameovertime

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	Pistelabel.text =str(pisteet)
	animation_player.play("Idle")


func _on_texture_button_pressed():
	klick += 1
	Painalabel.hide()
	if aika == false:
		print(lead)
		lead += 1
		Scorelabel.text = "Score : " + str(lead)
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
			Pistelabel.text = "Pisteesi : " + str(pisteet)
			if vaikeusaste <= 3:
				vaikeusaste += 1

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

func _on_timo_timeout():
	aika = true
	Global.score = lead
