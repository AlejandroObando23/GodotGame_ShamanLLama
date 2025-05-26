extends CharacterBody2D

# Variables de movimiento
var speed = 900
const gravity = 1800
const jump_speed = -900
const acceleration = 2000
const friction = 2000
var atacar: bool = false
var facing_direction = 1
var is_frozen: bool = false
var original_speed: int
var can_avoid_damage: bool = false
var damage_avoided: bool = false
var danio_player: bool = false

@onready var imgataque = $Area2D/ataque
@onready var freeze_timer = Timer.new()
signal disminuir_vida_definitivo
signal disminuir_enemigo
signal disminuir_carta_azul
signal disminuir_carta_verde


func _ready():
	original_speed = speed
	add_child(freeze_timer)
	freeze_timer.wait_time = 3.0
	freeze_timer.one_shot = true
	freeze_timer.timeout.connect(_unfreeze_character)
	set_process_input(true)
	$cartas_def.visible=false  # Asegurar que _input se procese

func _physics_process(delta):
	if is_frozen:
		velocity = Vector2.ZERO
		return
		
	if !atacar:
		apply_gravity(delta)
		handle_movement(delta)
		handle_jump()
		atacando()
		move_and_slide()
		$cartas_def.visible=false
	else:
		imgataque.visible = true
		await get_tree().create_timer(0.018).timeout
		imgataque.visible = false
		atacar = false
		

func _input(event):
	if Input.is_action_pressed("evitar"):
		
		damage_avoided = true
		can_avoid_damage = false
		# Opcional: Mostrar feedback visual/sonoro
		# $AudioStreamPlayer2D.play() 

func apply_gravity(delta):
	if not is_on_floor() and !is_frozen:
		velocity.y += gravity * delta
	elif is_on_floor():
		velocity.y = 0

func handle_movement(delta):
	var direction = 0
	if Input.is_action_pressed("left") and !is_frozen:
		direction = 1
		facing_direction = 1
	elif Input.is_action_pressed("right") and !is_frozen:
		direction = -1
		facing_direction = -1

	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

func handle_jump():
	if is_frozen: return
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

func atacando():
	if is_frozen: return
	
	if Input.is_action_just_pressed("ataque"):
		atacar = true
		imgataque.position.x = abs(imgataque.position.x) * facing_direction
		imgataque.flip_h = facing_direction < 0

func freeze_character(duration: float = 3.0):
	if is_frozen: return
	
	
	is_frozen = true
	speed = 0
	velocity = Vector2.ZERO
	can_avoid_damage = true
	damage_avoided = false
	
	freeze_timer.wait_time = duration
	freeze_timer.start()

func _unfreeze_character():
	is_frozen = false
	speed = original_speed
	if !danio_player:
		get_tree().get_nodes_in_group("vida_jugador")[0].menosvida(25)
		
		danio_player=false
	else:
		
		emit_signal("disminuir_enemigo")
		
		
		
	can_avoid_damage = false

func _on_character_body_2d_2_parar_principal():
	$cartas_def.visible=true
	freeze_character(1.0)




func _on_cartas_carta_azul():
	emit_signal("disminuir_carta_azul")
	damage_avoided = true
	can_avoid_damage = false
	


func _on_canvas_layer_carta_azul():
	emit_signal("disminuir_carta_azul")
	damage_avoided = true
	can_avoid_damage = false
	


func _on_cartas_def_carta_verde():
	emit_signal("disminuir_carta_verde")
	damage_avoided = true
	can_avoid_damage = false
	


func _on_character_body_2d_2_sin_atacar():
	danio_player=false
	


func _on_character_body_2d_2_atacar_play():
	danio_player=true
	
	
