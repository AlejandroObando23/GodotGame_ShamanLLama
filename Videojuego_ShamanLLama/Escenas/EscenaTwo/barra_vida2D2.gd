extends Area2D  # Este script está en el Area2D

# Referencia al nodo que quieres identificar (barra_identificar)
@onready var barra_identificar = $"../../barra_identificar"

# Esta función se llama cuando un cuerpo entra en contacto con el Area2D

	# Verifica si el cuerpo que colisionó es el nodo barra_identificar
	if body == barra_identificar:
		print("Hola mundo")
