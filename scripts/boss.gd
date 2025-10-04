extends Node2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_attack_timer_timeout() -> void:
    animated_sprite_2d.play("downward_attack")
    animation_player.play("downward_attack")


func _on_animated_sprite_2d_animation_finished() -> void:
    print("FINISHED")
    animated_sprite_2d.play("idle")
    animation_player.play("RESET")



func _on_area_2d_body_entered(body: Node2D) -> void:
    print(body.get_class())
