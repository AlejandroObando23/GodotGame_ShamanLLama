extends Node2D
signal carta_azulssss

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
	
	
func _process(delta):
	pass


func _on_carta_azul_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_signal("carta_azul")


func _on_carta_morada_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_carta_verde_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
