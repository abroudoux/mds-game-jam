extends TileMap

@onready var player_node : Area2D = get_node("player");
@onready var kepler_node : Area2D = get_node("kepler");
@onready var wasp_node : Area2D = get_node("wasp"); 
@onready var score_label : Label = get_node("score_label");

var score = 0

func _process(_delta):
	pass

func _ready():
	if score_label:
		player_node.connect("planet_body_entered", self._on_planet_captured);
		score_label.update_score(50);

func _on_planet_captured():
	kepler_node._on_capture()
