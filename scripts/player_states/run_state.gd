extends PlayerState

class_name RunState


func _ready() -> void:
    animated_sprite.play("run")

func freefall():
    change_state.call("jump_freefall")

func jump():
    change_state.call("jump_up")
    
#func attack():
    #change_state.call("attack")
    
func stop():
    super.stop()
    change_state.call("idle")
