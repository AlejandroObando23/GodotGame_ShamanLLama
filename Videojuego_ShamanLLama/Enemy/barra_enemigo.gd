extends ProgressBar
var maximo_valor:int


# Called when the node enters the scene tree for the first time.
func _ready():
	maximo_valor=100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func menos_enemigo_vida(damage):
	
	value-=damage
	if value == 0:
		
		$"..".queue_free()
		$"..".visible= false
		$"../Sprite2D".visible=false
		$"../CollisionShape2D".visible=false
		print("Listo")
