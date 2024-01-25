extends TileMap

@onready var player_node : Area2D = get_node("player");
@onready var kepler_node : Area2D = get_node("kepler");
@onready var wasp_node : Area2D = get_node("wasp"); 
@onready var gj_node : Area2D = get_node("gj");
@onready var mmvc_node : Area2D = get_node("mmvc");
@onready var gliese_node : Area2D = get_node("gliese");
@onready var titan_node : Area2D = get_node("titan");
@onready var corot_node : Area2D = get_node("corot");
@onready var hades_node : Area2D = get_node("hades");
@onready var lrtq_node : Area2D = get_node("lrtq");
@onready var trappist_node : Area2D = get_node("trappist");
@onready var score_label : Label = get_node("player/camera/score_label");
@onready var timer : Timer = get_node("timer");
@onready var audio_stream_player : AudioStreamPlayer = get_node("audio_stream_player");
@onready var game_over_label : Label = get_node("player/camera/CanvasLayer/game_over_label");
@onready var restart_game_label : Label = get_node("player/camera/CanvasLayer/restart_label");

var game_over = false;

func _process(_delta):
	pass

func _ready():
	audio_stream_player.play();
	restart_game_label.connect("restart_game", restart)
	if not game_over:
		player_node.show();
		kepler_node.show();
		wasp_node.show();
		gj_node.show();
		mmvc_node.show();
		gliese_node.show();
		titan_node.show();
		corot_node.show();
		hades_node.show();
		lrtq_node.show();
		trappist_node.show();
		player_node.connect("_on_planet_entered", _on_planet_entered);
		player_node.connect("_on_planet_exited", _on_planet_exited);
		kepler_node.connect("planet_captured", _on_planet_captured);
		wasp_node.connect("planet_captured", _on_planet_captured);
		gj_node.connect("planet_captured", _on_planet_captured);
		mmvc_node.connect("planet_captured", _on_planet_captured);
		gliese_node.connect("planet_captured", _on_planet_captured);
		titan_node.connect("planet_captured", _on_planet_captured);
		corot_node.connect("planet_captured", _on_planet_captured);
		hades_node.connect("planet_captured", _on_planet_captured);
		lrtq_node.connect("planet_captured", _on_planet_captured);
		trappist_node.connect("planet_captured", _on_planet_captured);
		game_over_label.hide();
		restart_game_label.hide();
		
func restart():
	game_over = false;
	game_over_label.hide();
	restart_game_label.hide();
	score_label.reset_score();
	kepler_node.reset_animation();
	wasp_node.reset_animation();
	gj_node.reset_animation();
	mmvc_node.reset_animation();
	gliese_node.reset_animation();
	titan_node.reset_animation();
	corot_node.reset_animation();
	hades_node.reset_animation();
	lrtq_node.reset_animation();
	trappist_node.reset_animation();
	_ready();
		
func _on_planet_captured():
	score_label._on_planet_captured();

func _on_timer_timeout():
	game_over = true;
	player_node.hide();
	kepler_node.hide();
	wasp_node.hide();
	gj_node.hide();
	mmvc_node.hide();
	gliese_node.hide();
	titan_node.hide();
	corot_node.hide();
	hades_node.hide();
	lrtq_node.hide();
	trappist_node.hide();
	game_over_label.show();
	restart_game_label.show();
	
func _on_planet_entered(planet_name):
	if not game_over:
		match planet_name:
			"kepler":
				_on_planet_kepler_captured();
			"wasp":
				_on_planet_wasp_captured();
			"gj":
				_on_planet_gj_captured();
			"mmvc":
				_on_planet_mmvc_captured();
			"gliese":
				_on_planet_gliese_captured();
			"titan":
				_on_planet_titan_captured();
			"corot":
				_on_planet_corot_captured();
			"hades":
				_on_planet_hades_captured();
			"lrtq":
				_on_planet_lrtq_captured();
			"trappist":
				_on_planet_trappist_captured();

func _on_planet_exited(planet_name):
	if not game_over:
		match planet_name:
			"kepler":
				_on_planet_kepler_exited()
			"wasp":
				_on_planet_wasp_exited()
			"gj":
				_on_planet_gj_exited()
			"mmvc":
				_on_planet_mmvc_exited();
			"gliese":
				_on_planet_gliese_exited();
			"titan":
				_on_planet_titan_exited();
			"corot":
				_on_planet_corot_exited();
			"hades":
				_on_planet_hades_exited();
			"lrtq":
				_on_planet_lrtq_exited();
			"trappist":
				_on_planet_trappist_exited();

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
	
func _on_planet_mmvc_captured():
	mmvc_node._on_capture();
	
func _on_planet_mmvc_exited():
	mmvc_node._on_player_exited();
	
func _on_planet_gliese_captured():
	gliese_node._on_capture();
	
func _on_planet_gliese_exited():
	gliese_node._on_player_exited();
	
func _on_planet_titan_captured():
	titan_node._on_capture();
	
func _on_planet_titan_exited():
	titan_node._on_player_exited();
	
func _on_planet_corot_captured():
	corot_node._on_capture();
	
func _on_planet_corot_exited():
	corot_node._on_player_exited();
	
func _on_planet_hades_captured():
	hades_node._on_capture();
	
func _on_planet_hades_exited():
	hades_node._on_player_exited();
	
func _on_planet_lrtq_captured():
	lrtq_node._on_capture();
	
func _on_planet_lrtq_exited():
	lrtq_node._on_player_exited();
	
func _on_planet_trappist_captured():
	trappist_node._on_capture();
	
func _on_planet_trappist_exited():
	trappist_node._on_player_exited();
