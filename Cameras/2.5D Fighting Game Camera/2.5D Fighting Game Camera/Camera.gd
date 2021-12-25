extends Camera

export(float) var zoom
export(float) var Angle
export(float) var Ypos

export(float) var speed
export(NodePath) var Player1Path
onready var Player1 = get_node(Player1Path)
export(NodePath) var Player2Path
onready var Player2 = get_node(Player2Path)
var p1left = false
var p1right = false
var p2left = false
var p2right = false

func _ready():
	var center = (Player2.global_transform.origin.x - Player1.global_transform.origin.x) / 2
	self.global_transform.origin = Player1.global_transform.origin + Vector3(center, Ypos, zoom)
	rotation_degrees.x = -Angle
	$Walls.rotation_degrees.x = Angle
	
func _process(delta):
	Move(delta)

func Move(delta):
	var center = (Player2.global_transform.origin.x - Player1.global_transform.origin.x) / 2
	var normal = (Player1.global_transform.origin.x + center) - self.global_transform.origin.x
	var zoom_dist = self.global_transform.origin.z - Player1.global_transform.origin.z
	var s = delta * speed * 0.8
	var dir = Vector2.ZERO
	if p1left and !p2right:
		dir.x = -1
	if p2left and !p1right:
		dir.x = -1
	if p1right and !p2left:
		dir.x = 1
	if p2right and !p1left:
		dir.x = 1
	self.global_transform.origin += Vector3(dir.x * s, 0, 0)


func _on_RIGHTAREA_body_entered(body):
	if body.name == Player1.name:
		p1right = true
	if body.name == Player2.name:
		p2right = true

func _on_RIGHTAREA_body_exited(body):
	if body.name == Player1.name:
		p1right = false
	if body.name == Player2.name:
		p2right = false


func _on_LEFTAREA_body_entered(body):
	if body.name == Player1.name:
		p1left = true
	if body.name == Player2.name:
		p2left = true


func _on_LEFTAREA_body_exited(body):
	if body.name == Player1.name:
		p1left = false
	if body.name == Player2.name:
		p2left = false
