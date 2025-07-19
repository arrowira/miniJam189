extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_body_entered(area):
	if area.name == "Player":
		if area.get_node("InventoryManager").Holding == true:
			$soupTexture.color = area.get_node("InventoryManager").getColor()
			#get_parent().get_node("GPUParticles2D")
			$"../GPUParticles2D".modulate = area.get_node("InventoryManager").getColor()
			area.get_node("InventoryManager").destroyObj()
		
