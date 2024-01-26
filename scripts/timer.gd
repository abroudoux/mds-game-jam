extends Timer

func _ready():
	self.wait_time = 20.0

func _process(_delta):
	pass;

func add_time(seconds_to_add: float):
	self.wait_time += seconds_to_add
