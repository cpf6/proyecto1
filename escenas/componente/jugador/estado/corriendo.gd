extends Estado

func enter():
	jugador.sprite.play("Corriendo")

func physics_update(delta):
	var direccion = Input.get_axis("mover_izquierda","mover_derecha")
	
	jugador.velocity.x = direccion * jugador.velocidad * delta
	if not jugador.is_on_floor():
		jugador.velocity.y += jugador.gravedad * delta
	jugador.move_and_slide()

		
	if jugador.velocity.x > 0:
		jugador.sprite.flip_h = false
	elif jugador.velocity.x < 0:
		jugador.sprite.flip_h = true
	
	if direccion == 0:
		get_parent().ir_a_estado_siguiente("Quieto")

	if Input.is_action_just_pressed("saltar") and jugador.is_on_floor():
		get_parent().ir_a_estado_siguiente("Saltar")

	if Input.is_action_just_pressed("atacar"):
		get_parent().ir_a_estado_siguiente("Atacar")
