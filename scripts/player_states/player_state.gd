extends Node2D

class_name PlayerState

var change_state: Callable
var animated_sprite: AnimatedSprite2D
var player: Player

func _physics_process(_delta):
    player.move_and_slide()

func setup(change_state: Callable, animated_sprite: AnimatedSprite2D, player: Player):
    self.change_state = change_state
    self.animated_sprite = animated_sprite
    self.player = player

func move_left():
    animated_sprite.flip_h = true
    player.velocity.x = -player.WALK_SPEED

func move_right():
    animated_sprite.flip_h = false
    player.velocity.x = player.WALK_SPEED

func stop():
    player.velocity.x = 0
    
func jump():
    pass
    
func jump_released():
    pass
    
func apex():
    pass

func freefall():
    pass

func attack():
    pass

func take_damage():
    pass
    
func grounded():
    pass
    
