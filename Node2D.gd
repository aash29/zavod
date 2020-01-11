extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

var TILE_SIZE = 32

onready var tile_map = $TileMap
onready var player = $Player

onready var player_tile = Vector2(3, 3)

func _input(event):
	if !event.is_pressed():
		return
	if event.is_action("ui_left"):
		try_move(-1,0)
	if event.is_action("ui_right"):
		try_move(1,0)
	if event.is_action("ui_up"):
		try_move(0,-1)
	if event.is_action("ui_down"):
		try_move(0,1)
			
func try_move(dx,dy):
	player_tile += Vector2(dx,dy)
	update_visuals()

func update_visuals():
	player.position = player_tile * TILE_SIZE


func _ready():
	OS.set_window_size(Vector2(1280,720))
	update_visuals()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
