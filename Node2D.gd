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
@onready var line_edit_d = $Control/LineEditD
@onready var line_edit_a = $Control/LineEditA
@onready var line_edit_b = $Control/LineEditB
@onready var button_limpar = $Control/ButtonLimpar
@onready var line_edit_altura_pe_a = $"Control/LineEditAlturaPeça"

@onready var line_edit_c = $Control/LineEditC
var can_calculate = false

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

	
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")




	
	
func _on_button_larg():

	profundidade = line_edit_profundidade.text.to_int()
	largura = line_edit_largura.text.to_int()
	vertical = TamVertical.text.to_int()
	horizontal = TamHorizontal.text.to_int()
	Escala = $Control/LineEditEscala.text.to_int()
	altura = line_edit_altura_pe_a.text.to_int()
	A = $Control/LineEditA.text.to_int()
	B = $Control/LineEditB.text.to_int()
	C = $Control/LineEditC.text.to_int()
	D = $Control/LineEditD.text.to_int()
	A = $Control/LineEditA/resultadoA.text.to_int()
	B = $Control/LineEditB/resultadoB.text.to_int()
	C = $Control/LineEditC/resultadoC.text.to_int()
	D = $Control/LineEditD/resultadoD.text.to_int()
	
	update_calculations()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_calculations():

	
	profundidade = line_edit_profundidade.text.to_int()
	largura = line_edit_largura.text.to_int()
	vertical = TamVertical.text.to_int()
	horizontal = TamHorizontal.text.to_int()

	Escala = $Control/LineEditEscala.text.to_int()
	altura = $Control/LineEditAlturaPeça.text.to_int()

	A = $Control/LineEditA/resultadoA
	B = $Control/LineEditB/resultadoB
	C = $Control/LineEditC/resultadoC
	D = $Control/LineEditD/resultadoD

	if Escala > 0 and profundidade > 0 and largura > 0:
		A = seno30 * largura * Escala
		B = seno30 * profundidade * Escala
		C = cos30 * profundidade * Escala
		D = cos30 * largura * Escala

	if profundidade > 0 and largura > 0 and Escala > 0:
		Y = altura * Escala + A + B
		X = C + D

		
	resultadoY = vertical - Y 
	resultadoX = horizontal - X 
	

	line_editresul_vertical.text = str(resultadoY / 2)
	line_editresul_horizont.text = str(resultadoX / 2)
	$Control/LineEditA.text = str(A)
	$Control/LineEditB.text = str(B)
	$Control/LineEditC.text = str(C)
	$Control/LineEditD.text = str(D)

	if resultadoX < 0 or resultadoY <0:
		aviso.show()
	else:
		aviso.hide()

	print("Y: ", Y)
	print("X: ", X)
	print("resultadoY: ", resultadoY)
	print("resultadoX: ", resultadoX)


func _on_button_limpar_pressed():
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func _on_touch_screen_button_pressed():

	get_tree().change_scene_to_file("res://Scenes/menu.tscn")






func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")





func _on_button_pressed():
	can_calculate = true
