extends Sprite2D  # Cambia a Node2D si no estás usando un Sprite

# Velocidad de movimiento (negativa para mover a la izquierda)
var speed: float = -400.0
# Límites de movimiento
var limit_left: float = -200.0  # Límite izquierdo
var limit_right: float = 190  # Límite derecho

func _process(delta: float) -> void:
	# Mueve el objeto a la izquierda (porque speed es negativo)
	position.x += speed * delta
	
	# Si el objeto alcanza el límite izquierdo, lo regresa al límite derecho
	if position.x <= limit_left:
		position.x = limit_right



