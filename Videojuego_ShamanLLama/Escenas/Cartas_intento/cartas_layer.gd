extends CanvasLayer

signal carta_azul
signal carta_verde

func cambiar_orden(carta):
	var contenedor = $HBoxContainer  # El padre directo de las cartas
	
	# Verificar que la carta existe y es hijo del contenedor
	if carta and carta.get_parent() == contenedor:
		# Alternar entre primera y última posición
		if carta.get_index() == 0:
			contenedor.move_child(carta, contenedor.get_child_count() - 1)
		else:
			contenedor.move_child(carta, 0)

func _ready():
	pass

func _process(delta):
	pass

func _on_card_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Has seleccionado la carta verde")
		emit_signal("carta_verde")
		cambiar_orden($HBoxContainer/card)

func _on_card_blue_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Has seleccionado la carta azul")
		emit_signal("carta_azul")
		cambiar_orden($HBoxContainer/card_blue)

func _on_card_2_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Has seleccionado otra carta verde")
		emit_signal("carta_verde")
		cambiar_orden($HBoxContainer/card_2)
