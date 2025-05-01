extends Node2D
signal prueba_senial
signal less_enemy
signal less_enemy_exited
func _ready():
	# Configurar todos los Area2D y sus CollisionShapes para ignorar pausa
	configure_anti_pause_nodes()
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func configure_anti_pause_nodes():
	# Lista de nodos que deben ignorar la pausa
	var nodes_to_configure = [
		$Area2D,
		$Area2D/barra_vida,
		$Area2D/CollisionShape2D,
		$Area2D2,
		$Area2D2/barra_identifier,
		$Area2D2/CollisionShape2D,
		$Area2D3,
		$Area2D3/CollisionShape2D,
		$Area2D3/CollisionShape2D2
	]
	
	for node in nodes_to_configure:
		if node:
			node.process_mode = Node.PROCESS_MODE_ALWAYS
			


func _on_area_2d_3_body_entered(body):
	
	emit_signal("prueba_senial")


func _on_area_2d_area_entered(area):
	print("Entro en senial")
	emit_signal("less_enemy")


func _on_area_2d_2_area_exited(area):
	emit_signal("less_enemy_exited")
