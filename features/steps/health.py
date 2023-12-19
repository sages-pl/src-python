from behave import *
from dragon import Dragon


@given('Health is {value:d}')
@when('Health is {value:d}')
def step_impl(context, value):
    context.dragon.health = value


@then('Health is {value:d}')
def step_impl(context, value):
    assert context.dragon.health == value


@then('Health is between {low:d} and {high:d}')
def step_impl(context, low: int, high: int):
    assert low <= context.dragon.health <= high


@when('Takes damage {value:d}')
def step_impl(context, value):
    context.dragon.take_damage(value)


@then('Is dead')
def step_impl(context):
    assert context.dragon.is_dead()
