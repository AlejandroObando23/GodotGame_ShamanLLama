extends CharacterBody2D

@export var speed : int = 100  # Velocidad ajustable desde el editor
const GRAVITY : int = 1800
var is_moving_left : bool = true
var is_frozen : bool = false
var original_speed : int  # Para guardar la velocidad original
var freeze_timer : Timer
var enemigo_stop : bool = false
var enemigo_acercar : bool = false
var activar_col_enemy : bool = false
var comando_activado : bool = false
var entrar_area : bool = false
var comando_activado_verde: bool = false
var c_verde: bool = false
var c_azul: bool = false
signal parar_principal
signal sin_atacar
signal atacar_play

func _ready():
	original_speed = speed
	velocity.x = -speed  # Comienza moviéndose hacia la izquierda
	
	# Configurar el timer de congelamiento
	freeze_timer = Timer.new()
	add_child(freeze_timer)
	freeze_timer.wait_time = 1.0
	freeze_timer.one_shot = true
	freeze_timer.timeout.connect(_unfreeze_enemy)

func _physics_process(delta):
	if is_frozen:
		velocity = Vector2.ZERO  # Congelamiento completo
		return
		
	apply_gravity(delta)
	handle_wall_collision()
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor() and not is_frozen:  # Solo gravedad si no está congelado
		velocity.y += GRAVITY * delta
	elif is_on_floor():
		velocity.y = 0

func handle_wall_collision():
	if is_frozen: return  # No cambiar dirección si está congelado
	
	if is_on_wall():
		is_moving_left = !is_moving_left
		velocity.x = -speed if is_moving_left else speed
		$Sprite2D.flip_h = !is_moving_left

func freeze_enemy():
	if is_frozen: return  # Evitar múltiples congelamientos
	
	
	is_frozen = true
	speed = 0
	velocity = Vector2.ZERO
	freeze_timer.start()  # Inicia el contador de 3 segundos

func _unfreeze_enemy():
	is_frozen = false
	speed = original_speed  # Restaura la velocidad original
	velocity.x = -speed if is_moving_left else speed  # Continúa en la dirección que llevaba
	

func _on_node_2d_prueba_senial():
	emit_signal("parar_principal")
	enemigo_acercar= true
	
	freeze_enemy()  # Llama a la función de congelamiento




func _on_character_body_2d_disminuir_enemigo():
	print("Disminuyendo")
	
	if comando_activado and entrar_area:
		
		comando_activado=false
		enemigo_stop= true
		

	
	if enemigo_acercar and enemigo_stop :
		if c_verde:
			get_tree().get_nodes_in_group("vida_enemigo")[0].menos_enemigo_vida(25)
			c_verde=false
		elif c_azul:
			get_tree().get_nodes_in_group("vida_enemigo")[0].menos_enemigo_vida(50)
			c_azul=false
		
		enemigo_acercar= false

func _input(event):
	if Input.is_action_pressed("evitar"):
		comando_activado=true
	
func _on_node_2d_less_enemy():
	entrar_area= true
	emit_signal("atacar_play")

	




func _on_node_2d_less_enemy_exited():
	entrar_area= false
	comando_activado=false
	enemigo_stop=false
	emit_signal("sin_atacar")


func _on_character_body_2d_disminuir_carta_azul():
	
	comando_activado=true
	c_azul=true


func _on_character_body_2d_disminuir_carta_verde():
	comando_activado=true
	c_verde=true
