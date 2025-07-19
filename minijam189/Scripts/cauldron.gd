extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_body_entered(area):
	if area.name == "Player":
		$soupTexture.color = area.get_node("InventoryManager").getColor()
		area.get_node("InventoryManager").destroyObj()
	
