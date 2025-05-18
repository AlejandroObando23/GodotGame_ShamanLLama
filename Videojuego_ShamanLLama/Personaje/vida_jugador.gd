extends ProgressBar
var maxvalor:int



# Called when the node enters the scene tree for the first time.
func _ready():
	maxvalor= 100
func menosvida(damage):
	value-=damage
	if value ==0:
		print("Usted a perdido")
		get_tree().quit()
		
		$"..".visible=false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.

