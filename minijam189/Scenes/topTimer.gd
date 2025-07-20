extends CanvasLayer

func addTime(amt):
	t+=amt
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
var t = 70.0
var alive = 0

func _on_timer_timeout() -> void:
	t-=1
	
	
	if t <= -1:
		$DeathScreen.visible = true
		$DeathScreen/deathScreenAnchor/Panel/Label2.text = "You survivied " + str(alive) + " seconds"
	else:
		$Panel/Label.text = str(int(t))
		alive += 1
