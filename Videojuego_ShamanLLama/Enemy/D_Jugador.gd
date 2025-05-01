extends Area2D
signal colision_fluida

func _on_body_entered(body):
	emit_signal("colision_fluida", {"tipo": "fluida", "posicion": global_position})
