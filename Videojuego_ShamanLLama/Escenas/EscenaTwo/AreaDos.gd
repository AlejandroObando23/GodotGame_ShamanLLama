extends Area2D

var speed: float = -800.0
var limit_left: float = -30.0
var limit_right: float = 490.0
var dectector: bool= false
var col_detector: bool= false
signal prueba_senial

func _ready():
	# Configuración crítica para ignorar pausa
	process_mode = PROCESS_MODE_ALWAYS
	collision_layer = 5
	collision_mask = 6  # Detecta objetos en layer 2
	
	# Conexión de señales
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _physics_process(delta):
	position.x += speed * delta
	if position.x <= limit_left:
		position.x = limit_right
		
		

func _on_area_entered(area: Area2D):
	
	dectector= true

func _on_area_exited(area: Area2D):
	
	dectector=false






func _input(event):
	if Input.is_action_pressed("evitar"):
		acertar()

		# Opcional: Mostrar feedback visual/sonoro
		# $AudioStreamPlayer2D.play() 

func acertar():
	if dectector and col_detector:
		print("Acerto correctamente")
		dectector = false
		col_detector =  false
func _on_area_2d_3_body_entered(body):
	col_detector=true
