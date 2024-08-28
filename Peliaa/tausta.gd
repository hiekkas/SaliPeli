extends Node2D

var save_data:SaveData

func _on_ukkeli_salilla_time():
	$Control.show_gameover()

func _ready():
	save_data = SaveData.load_or_create()
