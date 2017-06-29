extends KinematicBody2D

class player:
	var score = 0
	var speed = 50
	var direction = Vector2(0,0)

class stick:
	var pos

var screen_size

var player1 = player.new()

func _ready():
	screen_size = get_viewport_rect().size
	#player1.direction = get_node("P Sprite").get_pos()
	set_process(true)
	pass

func _process(delta):
	player1.direction = Vector2(0,0)
	
	if(Input.is_key_pressed(KEY_UP)):
		player1.direction += Vector2(0,-1)
	elif(Input.is_key_pressed(KEY_DOWN)):
		player1.direction += Vector2(0,1)
	if(Input.is_key_pressed(KEY_LEFT)):
		player1.direction += Vector2(-1,0)
	elif(Input.is_key_pressed(KEY_RIGHT)):
		player1.direction += Vector2(1,0)
	
	#if( player1.direction.x > 
	# get_node("Player").set_pos(player1.direction)
	move(player1.direction * player1.speed * delta)
	var score= get_parent().get_parent().get_node("HUD/Score")
	if(is_colliding()):
		var other = get_collider()
		if( other.is_in_group("Sticks")):
			print("Put down that damn stick")
			other.set_pos(Vector2(rand_range(0,480),rand_range(0,720)))
			
			player1.score += 100
			score.set_text(str(player1.score))
		