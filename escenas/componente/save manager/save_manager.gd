extends Node

var datos_guardado : Dictionary = {"monedas" : 100, "nombre" : "Carlos"}

func _ready():
	Globales.save_manager = self
	guardar()

func guardar():
	datos_guardado.monedas = Globales.jugador.monedas
	var archivo = FileAccess.open("user://partida.save", FileAccess.WRITE)
	print(archivo)
	archivo.store_line(JSON.stringify(datos_guardado))

func cargar():
	var archivo_guardado = FileAccess.open("user://archivo_guardado.save",FileAccess.READ)
	var texto = archivo_guardado.get_line()
	var json = JSON.new() 
	json.parse(texto)
	datos_guardado = json.data
	
	Globales.jugador.monedas = datos_guardado.monedas
