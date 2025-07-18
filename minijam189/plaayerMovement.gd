extends CharacterBody2D


var SPEED = 800.0
const JUMP_VELOCITY = -400.0
var jumping = false
var input_direction = Vector2.ZERO
func _physics_process(delta: float) -> void:
	
	if velocity.x<0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	velocity = input_direction * SPEED
	if !jumping:
		if velocity.length() > 0.1:
			$anim.play("walk")
		else:
			$anim.play("idle")
	move_and_slide()
	if Input.is_action_just_pressed("jump") and !jumping:
		jumping = true
		SPEED*=1.5
		$anim.play("jump")
		$jumpTimer.start()
	else:
		if !jumping:
			input_direction = Input.get_vector("right","left", "up", "down")


func _on_jump_timer_timeout() -> void:
	SPEED/=1.5
	jumping = false
