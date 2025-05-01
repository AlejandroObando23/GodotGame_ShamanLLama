extends Area2D

func _ready():
	# Configuración crítica para ignorar pausa
	process_mode = PROCESS_MODE_ALWAYS
	collision_layer = 6  # Está en layer 2
	collision_mask = 5  # Detecta objetos en layer 1
	

