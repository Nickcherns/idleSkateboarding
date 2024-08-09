extends CharacterBody2D

var defaultPos = Vector2.ZERO
var kickPush = false
@export var kickPush_speed: float = 200.0
@export var slowDown_speed: float = -100
@export var TrickSelect : TrickSelector
@onready var animatedSprite = $AnimatedSprite2D
@onready var spriteHflip = $AnimatedSprite2D.flip_h

# Called when the node enters the scene tree for the first time.
func _ready():
	spriteHflip = false
	defaultPos = global_position
	animatedSprite.play("idleSkate")

func _process(delta):	
	# if skateboard position isnt in default position, then 
	#	skateboard has a negative velocity
	if global_position != defaultPos: 
		velocity.x = slowDown_speed
	if kickPush:
		velocity.x = kickPush_speed
	move_and_slide()
	
# start kickPush 'dash' function
func kickPushActive():
	# set kickPush true to start velocity push
	kickPush = true
	$KickPushTimer.start()	
	
# flip trick functions
# flip tricks WILL BE set as straight stance for now
func perform_ollie():
	animatedSprite.play("ollie")
func perform_kickflip():
	if animatedSprite.flip_h == true:
		animatedSprite.flip_h = false	
	animatedSprite.play("flipAway")
func perform_nollie_kickflip():
	if animatedSprite.flip_h == false:
		animatedSprite.flip_h = true
	animatedSprite.play("flipAway")
func perform_heelflip():
	if animatedSprite.flip_h == true:
		animatedSprite.flip_h = false
	animatedSprite.play("flipTowards")
func perform_nollie_heelflip():
	if animatedSprite.flip_h == false:
		animatedSprite.flip_h = true
	animatedSprite.play("flipTowards")
func perform_tre_flip():
	if animatedSprite.flip_h == true:
		animatedSprite.flip_h = false
	animatedSprite.play("treFlip")
func perform_nollie_tre_flip():
	if animatedSprite.flip_h == false:
		animatedSprite.flip_h = true
	animatedSprite.play("treFlip")
func perform_manual():
	if animatedSprite.flip_h == true:
		animatedSprite.flip_h = false
	animatedSprite.play("manualFull")
func perform_nose_manual():
	if animatedSprite.flip_h == false:
		animatedSprite.flip_h = true
	animatedSprite.play("manualFull")

# stop kick push velocity 
func _on_kick_push_timer_timeout():
	kickPush = false
	
# idle animation when ever an animation finishes
func _on_animated_sprite_2d_animation_finished():
	animatedSprite.play("idleSkate")

# checks trick name and mirrors if appropriate
func mirror_sprite(word):
	if word.contains("nollie"):
		animatedSprite.flip_h = true
	elif word.contains("nose"):
		animatedSprite.flip_h = true
	else:
		animatedSprite.flip_h = false
		
# mirror sprite and play random animation
func _on_perform_timer_timeout():
	var random_animation = TrickSelect.selectRandom()
	if typeof(random_animation) == TYPE_NIL:
		pass
	else:
		mirror_sprite(random_animation)
		var returned_animation = TrickSelect.returnAnimation(random_animation)
		animatedSprite.play(returned_animation)



