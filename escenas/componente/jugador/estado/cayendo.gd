extends Estado

func enter():
	jugador.sprite.play("Cayendo")

func physics_update(delta):
	jugador.velocity.y = jugador.gravedad * delta
	
	var direccion = Input.get_axis("mover_izquierda","mover_derecha")
	jugador.velocity.x = direccion * jugador.velocidad * delta
	
	if jugador.velocity.x > 0:
		jugador.sprite.flip_h = false
	elif jugador.velocity.x < 0:
		jugador.sprite.flip_h = true
	
	jugador.move_and_slide()
	if jugador.is_on_floor():
		get_parent().ir_a_estado_siguiente("Quieto")
