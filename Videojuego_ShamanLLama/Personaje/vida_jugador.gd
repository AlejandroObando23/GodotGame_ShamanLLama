extends ProgressBar
var maxvalor:int



# Called when the node enters the scene tree for the first time.
func _ready():
	maxvalor= 100
func menosvida(damage):
	value-=damage
	


# Called every frame. 'delta' is the elapsed time since the previous frame.

