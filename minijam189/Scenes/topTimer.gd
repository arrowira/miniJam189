extends CanvasLayer

func addTime(amt):
	t+=amt
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
var t = 50.0

func _on_timer_timeout() -> void:
	t-=1
	$Panel/Label.text = str(int(t))
