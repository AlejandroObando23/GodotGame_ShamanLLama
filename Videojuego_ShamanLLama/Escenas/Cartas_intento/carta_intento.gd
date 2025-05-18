extends Container

var startPosition
var cardHighLighted = false

func _ready():
	$AreaCarta/card.position.x = 5
	$AreaCarta/card.position.y = 50
	

func _on_mouse_entered():
	$Anim.play("select")
	cardHighLighted=true


func _on_mouse_exited():
	$Anim.play("deselect")
	cardHighLighted=false

func _on_gui_input(event):
	pass
	
func _gui_input(event):
	pass



