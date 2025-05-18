extends Container
var startPosition
var cardHighLighted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AreaCarta_Azul/card.position.x = -11.684
	$AreaCarta_Azul/card.position.y = 46.512


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	$Anim.play("select")
	cardHighLighted=true


func _on_mouse_exited():
	$Anim.play("deselect")
	cardHighLighted=false
