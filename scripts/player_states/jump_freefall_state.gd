extends PlayerState

class_name JumpFreefallState


func _ready() -> void:
    animated_sprite.play("jump_freefall")

func jump():
    if player.can_double_jump:
        player.can_double_jump = false
        change_state.call("jump_up")

func grounded():
    if player.velocity.x != 0:
        change_state.call("run")
    else:
        change_state.call("idle")
    
#func attack():
    #change_state.call("attack")
    
