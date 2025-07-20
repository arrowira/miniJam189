extends Node

var Holding = false
var ItemID = 0;
static var candy := preload("res://Scenes/CandyCorn.tscn")
static var heart :=  preload("res://Scenes/Heart.tscn")
static var voidE := preload("res://Scenes/VoidEssence.tscn")
static var lump := preload("res://Scenes/StrangeLump.tscn")
static var eye := preload("res://Scenes/Eyeball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Holding = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("drop"):
		if Holding:
			
			var instance
			match ItemID:
				1:
					instance = eye.instantiate()
					
				2:
					instance = heart.instantiate()
					
				3:
					instance = lump.instantiate()
					
				4:
					instance = candy.insantiate()
					
				5:
					instance = voidE.instantiate()
			instance.position = Vector2(get_parent().global_position.x+200,get_parent().global_position.y+100)
			destroyObj()
			get_parent().get_parent().get_parent().add_child(instance)
					
func destroyObj():
	for n in get_parent().get_node("Sprite2D").get_children():
		get_parent().get_node("Sprite2D").remove_child(n)
		n.queue_free()
	Holding = false
func getColor():
	match ItemID:
		1:
			return Color.ANTIQUE_WHITE
		2:
			return Color.RED
		3:
			return Color.PURPLE
		4:
			return Color.ORANGE
		5:
			return Color.BLACK
func ParseItem(Id):
	destroyObj();
	Holding = true
	var Texture = "";
	match Id:
		"Eye":
			ItemID = 1
			Texture = "res://sprites/Eyeball.png"
		"Heart":
			ItemID = 2
			Texture = "res://sprites/WashingMachineHeart.png"
		"Lump":
			ItemID = 3
			Texture = "res://sprites/StrangeLump.png"
		"Candy":
			ItemID = 4
			Texture = "res://sprites/CandyCorn.png"
		"Void":
			ItemID = 5
			Texture = "res://sprites/VoidEssence.png"
	var sprite = Sprite2D.new()
	sprite.texture = load(Texture)
	sprite.scale.x = 17
	sprite.scale.y = 17
	sprite.texture_filter = sprite.TEXTURE_FILTER_NEAREST
	get_node("/root/Node2D/player/Player/Sprite2D").add_child(sprite)
		
	
