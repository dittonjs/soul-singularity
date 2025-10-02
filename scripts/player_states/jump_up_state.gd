extends PlayerState

class_name JumpUpState


func _ready() -> void:
    animated_sprite.play("jump_up")
    player.velocity.y = -400

    
func jump_released():
    if player.velocity.y < -150:
        player.velocity.y = -150
        change_state.call("jump_apex")

func apex():
    change_state.call("jump_apex")
    
#func attack():
    #change_state.call("attack")
