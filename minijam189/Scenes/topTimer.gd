extends CanvasLayer

func addTime(amt):
	t+=amt
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
var t = 70.0
var alive = 0
var ended = false
func _on_timer_timeout() -> void:
	t-=1
	
	
	if t <= -1:
		$DeathScreen.visible = true
		$DeathScreen/deathImg/Label2.text = "You survivied " + str(alive) + " seconds"
		$DeathScreen/deathImg.position.x = (get_viewport().size.x-$DeathScreen/deathImg.size.x)/2
		$DeathScreen/deathImg.position.y = (get_viewport().size.y-($DeathScreen/deathImg.size.y/6))/2
		if !ended:
			get_parent().get_node("player/Player").ended = true
			ended = true
	else:
		$Panel/Label.text = str(int(t))
		alive += 1
		
