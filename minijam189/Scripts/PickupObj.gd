extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_body_entered(body):
	if body.name == "Player":
		if(get_node("/root/Node2D/player/Player/InventoryManager").Holding == false):
			match get_path():
				NodePath("/root/Node2D/Eyeball/Eye"):
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Eye")
				NodePath("/root/Node2D/Heart/Heart"):
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Heart")
				NodePath("/root/Node2D/StrangeLump/Lump"):
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Lump")
				NodePath("/root/Node2D/CandyCorn/Candy"):
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Candy")
				NodePath("/root/Node2D/VoidEssence/Void"):
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Void")
			queue_free()
			
