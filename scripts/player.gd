extends CharacterBody2D

class_name Player

var GRAVITY := 1000.0
const WALK_SPEED := 200
var state: PlayerState
var state_factory: PlayerStateFactory
var can_double_jump: bool = true

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
    state_factory = PlayerStateFactory.new()
    change_state("idle")

func _physics_process(delta):
    if not is_on_floor():
        velocity.y += delta * GRAVITY
        if velocity.y > -150:
            state.apex()
        if velocity.y > 0:
            state.freefall()
    
    
    if Input.is_action_just_released("ui_up"):
        state.jump_released()
        
    if Input.is_action_just_pressed("ui_up"):
        state.jump()
    
    if is_on_floor():
        GRAVITY = 1000
        can_double_jump = true
        state.grounded()


    if Input.is_action_pressed("ui_left"):
        state.move_left()
    elif Input.is_action_pressed("ui_right"):
        state.move_right()
    else:
        state.stop()


    # "move_and_slide" already takes delta time into account.
    move_and_slide() 


func change_state(new_state_name: String):
    if state != null:
        state.queue_free()
    state = state_factory.get_state(new_state_name).new()
    state.setup(Callable(self, "change_state"), animated_sprite_2d, self)
    state.name = "current_state"
    add_child(state)
