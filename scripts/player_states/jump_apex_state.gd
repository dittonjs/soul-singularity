extends PlayerState

class_name JumpApexState

func _ready() -> void:
    animated_sprite.play("jump_apex")


func freefall():
    change_state.call("jump_freefall")

func jump():
    if player.can_double_jump:
        player.can_double_jump = false
        change_state.call("jump_up")
#func attack():
    #change_state.call("attack")
