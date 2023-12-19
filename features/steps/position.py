from behave import *
from dragon import Dragon


@given('Dragon is created with name "{name}" and position x={x:d} y={y:d}')
@when('Dragon is created with name "{name}" and position x={x:d} y={y:d}')
def step_impl(context, name: str, x: int, y: int):
    context.dragon = Dragon(name, position_x=x, position_y=y)


@given('Position {axis} is {value:d}')
def step_impl(context, axis, value):
    match axis:
        case 'x': context.dragon.position_x = value
        case 'y': context.dragon.position_y = value


@then('Position {axis} is {value:d}')
def step_impl(context, axis, value):
    match axis:
        case 'x': assert context.dragon.position_x == value
        case 'y': assert context.dragon.position_y == value


@when('Gets position')
def step_impl(context):
    context.result = context.dragon.get_position()


@when('Sets position x={x:d} y={y:d}')
def step_impl(context, x: int, y: int):
    context.dragon.set_position(x=x, y=y)


@when('Changes position {direction} by {value:d}')
def step_impl(context, direction: str, value: int):
    context.dragon.change_position(**{direction: value})


@then('Result is exactly "{value}"')
def step_impl(context, value):
    assert context.result == eval(value)


@then('Result is between {low:d} and {high:d}')
def step_impl(context, low: int, high: int):
    assert low <= context.result <= high
