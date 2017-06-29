extends Label
onready var util = load("util/help.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_pressed():
	# self.set_text(util.get_size("Label"))
	get_tree().change_scene("res://Hello World.tscn")
	pass # replace with function body
