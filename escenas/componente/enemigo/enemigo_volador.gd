extends Enemigos

@export var hitbox: Area2D
@export var amplitud: float = 60
@export var periodo: float = 2.0
@export var velocidad_x: float = 300
@export var distancia_x: float = 400

@onready var posicion_inicial : Vector2 = position

var tiempo: float = 0.0
var dir_x: int = 1

func _physics_process(delta : float) -> void:
	position.x += dir_x * velocidad_x * delta

	tiempo += delta
	var offset_y := sin(tiempo * TAU / periodo) * amplitud
	position.y = posicion_inicial.y + offset_y

	if abs(position.x - posicion_inicial.x) >= distancia_x:
		dir_x *= -1
		tiempo = 0.0

func _on_timer_timeout():
	for cuerpo in hitbox.get_overlapping_bodies():
		if cuerpo.is_in_group("Jugador"):
			cuerpo.herir(50)
