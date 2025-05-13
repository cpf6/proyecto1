extends Node

var datos_guardado : Dictionary = {"monedas" : 100, "nombre" : "Carlos"}

func ready():
	Globales.save_manager = self

func guardar():
	var archivo = FileAccess.open("user://partida.save", FileAccess.WRITE)
	archivo.store_line("hola")

func cargar():
	var archivo_guardado = FileAccess.open("user://archivo_guardado.save",FileAccess.READ)
	var texto = archivo_guardado.get_line()
	var json = JSON.new() 
	json.parse(texto) 
	print(json.data)
	var diccionario = json.delta 
