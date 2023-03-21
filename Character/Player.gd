extends CharacterBody2D

@export var speed: int = 60
@onready var animation = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	velocity = moveDirection*speed
	
	
func updateAnimation():
	if velocity.length() == 0:
		animation.play("Idle_Down")
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		animation.play("Walk" + "_" + direction)
	
	
func _physics_process(delta):
	var _delta = delta
	handleInput()
	move_and_slide()
	updateAnimation()
