extends TileMap

@onready var PlayerNode : Area2D = get_node("Player")
@onready var KeplerNode : Area2D = get_node("Kepler")

func _process(_delta):
	pass

func _ready():
	PlayerNode.connect("player_body_entered", self.change_kepler_animation)

func change_kepler_animation():
	KeplerNode.on_capture();
