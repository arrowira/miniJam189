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
			get_node("/root/Node2D/player/Player/InventoryManager").ParseItem("Eye")
			queue_free()
