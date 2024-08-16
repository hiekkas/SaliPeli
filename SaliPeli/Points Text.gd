extends CanvasLayer

var NostoPiste = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Points.text = "Pisteet : " + str(NostoPiste)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
