extends Node2D

var Going = false
var items = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StartRecipe(5)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#cauldron coords -21 31
func StartRecipe(amt):
	var d = -21-(160*(amt/2))
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(amt):
		rng.randomize()
		var n = rng.randi_range(1, 5)
		var Texture = "";
		match n:
			1:
				Texture = "res://sprites/Eyeball.png"
			2:
				Texture = "res://sprites/WashingMachineHeart.png"
			3:
				Texture = "res://sprites/StrangeLump.png"
			4:
				Texture = "res://sprites/CandyCorn.png"
			5:
				Texture = "res://sprites/VoidEssence.png"
		var sprite = Sprite2D.new()
		sprite.texture = load(Texture)
		sprite.scale.x = 17
		sprite.scale.y = 17
		sprite.position.x = d
		d+=160
		sprite.position.y = -300
		sprite.texture_filter = sprite.TEXTURE_FILTER_NEAREST
		get_node(get_path()).add_child(sprite)
		pass
		
	pass
