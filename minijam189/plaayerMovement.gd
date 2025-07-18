extends CharacterBody2D


var SPEED = 800.0
const JUMP_VELOCITY = -400.0
var jumping = false
var input_direction = Vector2.ZERO
func _physics_process(delta: float) -> void:
	
	
	velocity = input_direction * SPEED
	if velocity.length() > 0.1:
		$anim.play("walk")
	else:
		$anim.play("idle")
	move_and_slide()
	if Input.is_action_just_pressed("jump") and !jumping:
		jumping = true
		SPEED*=1.5
		print("startTimer")
		$jumpTimer.start()
	else:
		if !jumping:
			input_direction = Input.get_vector("right","left", "up", "down")


func _on_jump_timer_timeout() -> void:
	print("endTimer")
	SPEED/=1.5
	jumping = false
