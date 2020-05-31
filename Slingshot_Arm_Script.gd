extends Node2D


export (NodePath) var ammo_node_path
onready var ammo_node = get_node(ammo_node_path)


func _process(delta):
	update()


func _draw():
	var line = $Line2D	
	line.draw_line(Vector2(0,0), get_global_mouse_position(), Color.black, 10.0)
	
#	line.clear_points()
#	line.draw_line(global_position, get_global_mouse_position(), Color.black)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
