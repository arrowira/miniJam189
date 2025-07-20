extends CharacterBody2D

var defaultSpeed = 800.0
var SPEED = 800.0
const JUMP_VELOCITY = -400.0
var jumping = false
var input_direction = Vector2.ZERO
var slipping = false
func _physics_process(delta: float) -> void:
	print(global_position.y)
	z_index = (global_position.y/100)
	if velocity.x<0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	if !slipping:
		velocity = input_direction * SPEED
	else:
		velocity *= 0.98
	if !jumping and !slipping:
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
		if !jumping and !slipping:
			input_direction = Input.get_vector("right","left", "up", "down")
	

func _on_jump_timer_timeout() -> void:
	SPEED/=1.5
	jumping = false




func _on_player_area_area_entered(area: Area2D) -> void:
	if area.name == "bigHand" and !jumping or area.name == "littleHand" and !jumping:
		#SPEED = 0
		velocity=Vector2.ZERO
		if position.x>-600:
			velocity.y += 1000
		else:
			velocity.y += -1000
		slipping = true
		$anim.play("slip")
		$InventoryManager.destroyObj()
		$slipTimer.start()
		


func _on_slip_timer_timeout() -> void:
	slipping = false
	#SPEED = defaultSpeed
	$anim.play("idle")
