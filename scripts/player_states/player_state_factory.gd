class_name PlayerStateFactory


var states :=  {
    "idle": IdleState,
    "run": RunState,
    "jump_up": JumpUpState,
    "jump_apex": JumpApexState,
    "jump_freefall": JumpFreefallState,
    "attack": AttackState,
    "dash": DashState
}



func get_state(state_name):
    if states.has(state_name):
        return states.get(state_name)
    else:
        printerr("No state ", state_name, " in state factory!")
