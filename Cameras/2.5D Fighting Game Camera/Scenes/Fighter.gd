extends KinematicBody

export(bool) var P1
export(float) var Speed


func _ready():
	pass


func _process(delta):
	var dir = 0
	
	if P1:
		if Input.is_action_pressed("P1left"):
			dir = -1
		if Input.is_action_pressed("P1right"):
			dir = 1
	else:
		if Input.is_action_pressed("P2left"):
			dir = -1
		if Input.is_action_pressed("P2right"):
			dir = 1
	
	self.move_and_collide(Vector3(dir * Speed * delta, 0, 0))
