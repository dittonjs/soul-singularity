extends PlayerState


class_name AttackState

func _ready() -> void:
    animated_sprite.play("attack")
    player.can_attack = false

func attack_timer_timeout():
    change_state.call("previous")

#func move_left():
    ##player.velocity.x = 0
    #pass
#
#func move_right():
    ##player.velocity.x = 0
    #pass


#func attack():
    #change_state.call("attack")
