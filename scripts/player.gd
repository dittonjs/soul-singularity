extends CharacterBody2D

class_name Player

var GRAVITY := 1000.0
const WALK_SPEED := 200
var state: PlayerState
var state_factory: PlayerStateFactory
var can_double_jump: bool = true
var can_attack = true
var current_state_name: String
var previous_state_name: String
var can_dash := true

@onready var attack_timer: Timer = $AttackTimer
@onready var dash_timer: Timer = $DashTimer
@onready var dash_reset_timer: Timer = $DashResetTimer

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
    
    
    if Input.is_action_just_released("jump"):
        state.jump_released()
        
    if Input.is_action_just_pressed("jump"):
        state.jump()
    
    if is_on_floor():
        GRAVITY = 1000
        can_double_jump = true
        state.grounded()


    if Input.is_action_pressed("move_left"):
        state.move_left()
    elif Input.is_action_pressed("move_right"):
        state.move_right()
    else:
        state.stop()
    
    if Input.is_action_just_pressed("attack"):
        state.attack()
        
    if Input.is_action_just_pressed("dash"):
        state.dash()
    if Input.is_action_just_released("dash"):
        dash_timer.stop()
        state.dash_timer_timeout()
    

    # "move_and_slide" already takes delta time into account.
    move_and_slide() 


func change_state(new_state_name: String):
    
    if state != null:
        state.queue_free()
    if new_state_name == "previous":
        if previous_state_name == "jump_up":
            previous_state_name = "jump_apex"
        state = state_factory.get_state(previous_state_name).new()
        current_state_name = previous_state_name
    else:
        if state != null:
            previous_state_name = current_state_name
            current_state_name = new_state_name
        state = state_factory.get_state(new_state_name).new()
    
    state.setup(Callable(self, "change_state"), animated_sprite_2d, self)
    state.name = "current_state"
    add_child(state)
    


func _on_attack_timer_timeout() -> void:
    can_attack = true
    state.attack_timer_timeout()


func _on_dash_timer_timeout() -> void:
    state.dash_timer_timeout()


func _on_dash_reset_timer_timeout() -> void:
    can_dash = true
