extends Node

var Holding = false
var ItemID = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Holding = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ItemID != 0:
		print(ItemID)
	pass

func ParseItem(Id):
	match Id:
		"Eye":
			ItemID = 1
		"Heart":
			ItemID = 2
		
	
