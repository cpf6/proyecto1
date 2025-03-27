extends Estado

func enter():
	jugador.sprite.play("Saltar")

func physics_update(_delta):
	if Input.is_action_just_pressed("saltar"):
		jugador.velocity.y = -jugador.gravedad
		jugador.move_and_slide()
