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
	
	player_node.planet_kepler_body_entered.connect(_on_planet_kepler_captured);
	player_node.planet_kepler_body_exited.connect(_on_planet_kepler_exited);
	player_node.planet_wasp_body_entered.connect(_on_planet_wasp_captured);
	player_node.planet_wasp_body_exited.connect(_on_planet_wasp_exited);
	player_node.planet_gj_body_entered.connect(_on_planet_gj_captured);
	player_node.planet_gj_body_exited.connect(_on_planet_gj_exited);

func _on_planet_kepler_captured():
	kepler_node._on_capture();
	
func _on_planet_kepler_exited():
	kepler_node._on_player_exited();
	
func _on_planet_wasp_captured():
	wasp_node._on_capture();
	
func _on_planet_wasp_exited():
	wasp_node._on_player_exited();
	
func _on_planet_gj_captured():
	gj_node._on_capture();
	
func _on_planet_gj_exited():
	gj_node._on_player_exited();
	
