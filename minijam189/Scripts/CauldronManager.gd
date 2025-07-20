extends Node2D

var Going = false
var items = []
var ari = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StartRecipe(5)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func Filled(id):
	if(items[0] == id):
		ari+=1
		get_node(str(ari-1)).queue_free()
		items.remove_at(0)
		if len(items) == 0:
			$winTimer.start()
			get_parent().get_node("CanvasLayer").addTime(50)
			
	pass

#cauldron coords -21 31
func StartRecipe(amt):
	var d = -21-(160*(amt/2))
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(amt):
		rng.randomize()
		var n = rng.randi_range(1, 5)
		var Texture = ""
		match n:
			1:
				Texture = "res://sprites/Eyeball.png"
				items.append(1)
			2:
				Texture = "res://sprites/WashingMachineHeart.png"
				items.append(2)
			3:
				Texture = "res://sprites/StrangeLump.png"
				items.append(3)
			4:
				Texture = "res://sprites/CandyCorn.png"
				items.append(4)
			5:
				Texture = "res://sprites/VoidEssence.png"
				items.append(5)
		var sprite = Sprite2D.new()
		sprite.texture = load(Texture)
		sprite.name = str(i)
		sprite.scale.x = 17
		sprite.scale.y = 17
		sprite.position.x = d
		d+=160
		sprite.position.y = -300
		sprite.texture_filter = sprite.TEXTURE_FILTER_NEAREST
		get_node(get_path()).add_child(sprite)
		
	pass


func _on_win_timer_timeout() -> void:
	StartRecipe(5)
