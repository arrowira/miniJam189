extends Area2D
@export var itemID = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_body_entered(body):
	if body.name == "Player":
		if(get_node("/root/Node2D/player/Player/InventoryManager").Holding == false):
			if(itemID != get_node("").Item[0]):
				return
			match itemID:
				0:
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Eye")
				1:
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Heart")
				2:
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Lump")
				3:
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Candy")
				4:
					get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Void")
			queue_free()
			
