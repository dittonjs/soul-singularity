extends PlayerState

class_name DashState

func _ready() -> void:
    animated_sprite.play("dash")
    player.dash_timer.start(.15)
    player.dash_reset_timer.start(.5)
    if animated_sprite.flip_h:
        player.velocity.x = -1300
    else:
        player.velocity.x = 1300
        
 

func _physics_process(_delta):
    player.velocity.y = 0   

func stop():
    pass

func move_left():
    pass

func move_right():
    pass
    
func dash_timer_timeout():
    change_state.call("previous")

func dash():
    pass

#func attack():
    #change_state.call("attack")
