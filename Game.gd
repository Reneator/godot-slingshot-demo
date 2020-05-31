extends Node2D

export (float) var initial_velocity = 100
export (float) var velocity_multiplier = 2

var start_drag_position : Vector2
var last_drag_position : Vector2

var is_dragging = false

export (PackedScene) var ammo_scene

var current_ammo: RigidBody2D
var current_ammo_drag_start_pos : Vector2

func _process(delta):
	if Input.is_action_pressed("ui_touch"):
		if not is_dragging:
			spawn_ammo()
			is_dragging = true
			start_drag_position = get_global_mouse_position()
		last_drag_position = get_global_mouse_position()
	if Input.is_action_just_released("ui_touch"):
#		last_drag_position = get_global_mouse_position()
		is_dragging = false
		fire_ammo()
		

	if is_dragging:
		var position_offset = last_drag_position - start_drag_position
		current_ammo.global_position = current_ammo_drag_start_pos + position_offset
		
		

func fire_ammo():
	var direction = last_drag_position.direction_to(start_drag_position) # already normalized
	var length = last_drag_position.distance_to(start_drag_position)
	
	var linear_velocity = direction * length
	current_ammo.mode = RigidBody2D.MODE_RIGID
	current_ammo.linear_velocity = linear_velocity * 10
	Events.emit_signal("ammo_fired")
	
#	var drop = drop_scene.instance()
	
#	spawn(drop, linear_velocity)

func spawn_ammo():
	var ammo: RigidBody2D = ammo_scene.instance()
	current_ammo = ammo
	get_tree().root.add_child(current_ammo)
	reset_ammo_pos()
	Events.emit_signal("ammo_added", current_ammo)
	ammo.mode = ammo.MODE_STATIC

func reset_ammo_pos():
	current_ammo.global_position = $Slingshot/Ammo_Start_Position.global_position
	current_ammo_drag_start_pos = current_ammo.global_position
	
	
