extends CharacterBody2D

class_name Enemigos

@export var vida : int = 15
@export var sprite : Sprite2D

func herir (damage : int):
	vida -= damage 
	
	if vida <= 0: 
		morir()

func morir ():
	queue_free()

func _process(_delta):
	voltear_sprite()

func voltear_sprite():
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
