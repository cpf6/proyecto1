extends Node
class_name MaquinaEstado

@export var jugador : CharacterBody2D
var estado_actual : Estado

func _ready():
	estado_actual = get_child(0)
	estado_actual.enter()

func _process(_delta):
	estado_actual.update(_delta)

func ir_a_estado_siguiente(estado_siguiente : Estado):
	estado_actual.exite()
	estado_actual = estado_siguiente
	estado_actual.enter()
