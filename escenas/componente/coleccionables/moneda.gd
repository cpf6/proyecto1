extends Coleccionable

func coleccionado():
	Globales.jugador.monedas += 1 
	queue_free()
