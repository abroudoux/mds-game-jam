extends TileMap

@onready var player_node : Area2D = get_node("player");
@onready var kepler_node : Area2D = get_node("kepler");
@onready var wasp_node : Area2D = get_node("wasp"); 
@onready var gj_node : Area2D = get_node("gj");

var score_label : Label

func _process(_delta):
	pass

func _ready():
	score_label = preload("res://scripts/score_label.gd").new()
	score_label.update_score(str(50));
	
	player_node.connect("_on_planet_entered", _on_planet_entered);
	player_node.connect("_on_planet_exited", _on_planet_exited);
	
func _on_planet_entered(planet_name):
	match planet_name:
		"kepler":
			_on_planet_kepler_captured()
		"wasp":
			_on_planet_wasp_captured()
		"gj":
			_on_planet_gj_captured()

func _on_planet_exited(planet_name):
	match planet_name:
		"kepler":
			_on_planet_kepler_exited()
		"wasp":
			_on_planet_wasp_exited()
		"gj":
			_on_planet_gj_exited()

func _on_planet_kepler_captured():
	print("print from _on_planet_kepler_captured")
	kepler_node._on_capture();
	
func _on_planet_kepler_exited():
	print("print from _on_planet_kepler_exited")
	kepler_node._on_player_exited();
	
func _on_planet_wasp_captured():
	print("print from _on_planet_wasp_captured")
	wasp_node._on_capture();
	
func _on_planet_wasp_exited():
	print("print from _on_planet_wasp_exited")
	wasp_node._on_player_exited();
	
func _on_planet_gj_captured():
	print("print from _on_planet_gj_captured")
	gj_node._on_capture();
	
func _on_planet_gj_exited():
	print("print from _on_planet_gj_exited")
	gj_node._on_player_exited();
	
