extends Area2D
# vars 
@export var speed = 150
@onready var screensize = get_viewport_rect().size
@export var cooldown = 0.25 
@export var bullet_scene : PackedScene
var can_shoot = true

func _ready():
	start()
	

func _process(delta):
	var input = Input.get_vector("left", "right", "up", "down")
	if input.x > 0:
		$Ship.frame = 2
		$Ship/Boosters.animation = "right"
	elif input.x < 0:
		$Ship.frame = 0
		$Ship/Boosters.animation = "left"
	else:
		$Ship.frame = 1
		$Ship/Boosters.animation = "forward"
	position += input * speed * delta
	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))
	
func start():
	position = Vector2(screensize.x / 2 , screensize.y - 64)
	$GunCooldown.wait_time - cooldown
