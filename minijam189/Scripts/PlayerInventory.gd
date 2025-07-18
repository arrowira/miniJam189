extends Node

var Holding = false
var ItemID = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Holding = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func ParseItem(Id):
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
			ItemID = 4
			Texture = "res://sprites/VoidEssence.png"
	var sprite = Sprite2D.new()
	sprite.texture = load(Texture)
	sprite.scale.x = 10
	sprite.scale.y = 10
	sprite.texture_filter = sprite.TEXTURE_FILTER_NEAREST
	get_node("/root/Node2D/player/Player").add_child(sprite)

		
	
