extends Node2D

static var candy := preload("res://Scenes/CandyCorn.tscn")
static var heart :=  preload("res://Scenes/Heart.tscn")
static var voidE := preload("res://Scenes/VoidEssence.tscn")
static var lump := preload("res://Scenes/StrangeLump.tscn")
static var eye := preload("res://Scenes/Eyeball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$spawnTimer.start()


var spawnID = 0

func _on_spawn_timer_timeout() -> void:
	#spawn
	spawnID+=1
	spawnID = spawnID % 5
	var instance
	match spawnID:
		0:
			instance = eye.instantiate()
		1:
			instance = lump.instantiate()
		2:
			instance = voidE.instantiate()
		3:
			instance = heart.instantiate()
		4:
			instance = candy.instantiate()
	var angle = randf_range(0,360)
	var hyp = randf_range(300,1700)
	instance.position = Vector2(sin(deg_to_rad(angle))*hyp,cos(deg_to_rad(angle))*hyp)
	#print(instance.position)
	get_parent().add_child(instance)
	
