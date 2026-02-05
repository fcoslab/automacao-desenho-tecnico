extends Node2D

var cos30 = 0.866
var seno30 = 0.5

@onready var TamVertical = $Control/LineEditVertical
@onready var TamHorizontal = $Control/LineEditHorizontal
@onready var line_edit_profundidade = $Control/LineEditProfund
@onready var line_edit_largura = $Control/LineEditLarg
@onready var button = $Control/Button
@onready var line_editresul_vertical = $Control/LineEditresulVertical
@onready var line_editresul_horizont = $Control/LineEditresulHorizont

@onready var button_limpar = $Control/ButtonLimpar
@onready var line_edit_altura_pe_a = $"Control/LineEditAlturaPeça"

@onready var line_edit_c = $Control/LineEditC

@onready var aviso = $aviso

@onready var profundidade = 0
@onready var largura = 0
@onready var vertical = 0
@onready var horizontal = 0

var A
var B
var C
var D


var Y
var X
var altura = 0
var resultadoY
var resultadoX
@onready var Escala = 0
@onready var resultado
# Called when the node enters the scene tree for the first time.
func _ready():
	button.connect("pressed", Callable(self, "_on_button_larg"))
	button_limpar.connect("pressed", Callable(self, "_on_button_limpar"))

	




func _on_button_limpar():
	
	line_edit_profundidade.text = line_edit_profundidade.text.replace(r"\d", "")
	line_edit_largura.text = line_edit_largura.text.replace(r"\d", "")
	line_editresul_vertical.text = line_editresul_vertical.text.replace(r"\d", "")
	line_editresul_horizont.text = line_editresul_horizont.text.replace(r"\d", "")
	
	
func _on_button_larg():

	profundidade = line_edit_profundidade.text.to_int()
	largura = line_edit_largura.text.to_int()
	vertical = TamVertical.text.to_int()
	horizontal = TamHorizontal.text.to_int()
	Escala = $Control/LineEditEscala.text.to_int()
	altura = line_edit_altura_pe_a.text.to_int()

	update_calculations()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_calculations():

	
	profundidade = line_edit_profundidade.text.to_int()
	largura = line_edit_largura.text.to_int()
	vertical = TamVertical.text.to_int()
	horizontal = TamHorizontal.text.to_int()

	Escala = $Control/LineEditEscala.text.to_int()
	altura = $Control/LineEditAlturaPeça.text.to_int()



		
	if profundidade > 0 and largura > 0 and Escala > 0:
		
		Y = altura * Escala + profundidade*Escala + 20
		X = profundidade * Escala + largura*Escala + 20
		
	resultadoY = vertical - Y 
	resultadoX = horizontal - X 
	

	line_editresul_vertical.text = str(resultadoY / 2)
	line_editresul_horizont.text = str(resultadoX / 2)

	$Control/LineEditEscala.text = str(Escala)
	
	if resultadoX < 0 or resultadoY <0:
		aviso.show()
	else:
		aviso.hide()


	print("Y: ", Y)
	print("X: ", X)
	print("resultadoY: ", resultadoY)
	print("resultadoX: ", resultadoX)
	
	
	


func _on_button_limpar_pressed():
	get_tree().change_scene_to_file("res://Scenes/vista_essencial.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
