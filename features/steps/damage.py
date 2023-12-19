from behave import *
from dragon import Dragon


@when('Makes damage')
def step_impl(context):
    context.result = context.dragon.make_damage()
