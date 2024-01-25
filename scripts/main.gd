extends TileMap

@onready var player_node : Area2D = get_node("player");
@onready var kepler_node : Area2D = get_node("kepler");
@onready var wasp_node : Area2D = get_node("wasp"); 
@onready var gj_node : Area2D = get_node("gj");

var score_label : Label

func _process(_delta):
	pass

func _ready():
	print("azeaez")
	score_label = preload("res://scripts/score_label.gd").new()
	score_label.update_score(str(50));
	
	player_node.planet_body_entered.connect( _on_planet_kepler_captured);
	#player_node.planet_body_entered.connect( _on_planet_wasp_captured);
	#player_node.planet_body_entered.connect( _on_planet_gj_captured);

func _on_planet_kepler_captured():
	print("kepler")
	kepler_node._on_capture();

func _on_planet_wasp_captured():
	wasp_node._on_capture();
	
func _on_planet_gj_captured():
	gj_node._on_capture();
