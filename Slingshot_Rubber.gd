extends Line2D

var ammo : Node2D

func _ready():
	Events.connect("ammo_added", self, "on_ammo_added")
	Events.connect("ammo_fired", self, "on_ammo_fired")

func _process(delta):
	if not ammo:
		hide()
		return
	update()

func _draw():
	if not ammo:
		return
	var target_pos = ammo.global_position - global_position
	draw_line(Vector2(0,0), target_pos, Color.black, 10.0)

func on_ammo_added(ammo_node):
	show()
	ammo = ammo_node

func on_ammo_fired():
	ammo = null
