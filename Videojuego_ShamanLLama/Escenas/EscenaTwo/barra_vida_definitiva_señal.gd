extends Node2D
signal colision_detectada

# Called when the node enters the scene tree for the first time.
func _ready():
	colision_detectada.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_stop_time_colision_fluida():
	pass # Replace with function body.
