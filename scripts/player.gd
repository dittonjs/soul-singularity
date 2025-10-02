extends CharacterBody2D

class_name Player

var GRAVITY := 1000.0
const WALK_SPEED := 200
var released := false
var state: PlayerState
var state_factory: PlayerStateFactory

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
    state_factory = PlayerStateFactory.new()
    change_state("idle")

func _physics_process(delta):
    if not is_on_floor():
        velocity.y += delta * GRAVITY
    

    if not is_on_floor() and velocity.y > 0:
        GRAVITY = 1800
    
    if is_on_floor():
        GRAVITY = 1000
        released = false
    if is_on_floor() and Input.is_action_just_pressed("ui_up"):
        velocity.y -= 500
    
    if !is_on_floor() and Input.is_action_just_released("ui_up") and velocity.y < 0 && !released:
        velocity.y = -150
        released = true

    if Input.is_action_pressed("ui_left"):
        animated_sprite_2d.flip_h = true
        animated_sprite_2d.play("run")
        velocity.x = -WALK_SPEED
    elif Input.is_action_pressed("ui_right"):
        animated_sprite_2d.flip_h = false
        animated_sprite_2d.play("run")
        velocity.x =  WALK_SPEED
    else:
        animated_sprite_2d.play("idle")
        velocity.x = 0


    # "move_and_slide" already takes delta time into account.
    move_and_slide() 


func change_state(new_state_name: String):
    if state != null:
        state.queue_free()
    state = state_factory.get_state(new_state_name).new()
    state.setup(Callable(self, "change_state"), animated_sprite_2d, self)
    state.name = "current_state"
    add_child(state)
