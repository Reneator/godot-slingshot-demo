extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("ammo_added", self, "on_ammo_added")

func on_ammo_added(ammo_node):
	if ammo_node != self:
		queue_free()



