extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	pass

func _fixed_process(delta):
	if(is_colliding()):
		if(get_collider().get_name() =="Player"):
			print("move the stick")
			set_pos(Vector2(rand_range(0,480),rand_range(0,720)))
			move(Vector2(0,0))