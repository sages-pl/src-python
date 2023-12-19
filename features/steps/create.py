from behave import *
from dragon import Dragon


@given('Dragon does not exist')
def step_impl(context):
    assert 'dragon' not in globals()


@when('Dragon is created with name "{name}"')
@given('Dragon is created with name "{name}"')
def step_impl(context, name):
    context.dragon = Dragon(name)


@when('Dragon is created without name')
def step_impl(context):
    try:
        dragon = Dragon()  # noqa
    except Exception as exc:
        context.exc = exc
        context.msg = str(exc)
    else:
        context.exc = None
        context.msg = None


@then('Dragon exists')
def step_impl(context):
    assert context.dragon is not None


@then('Name is "{name}"')
def step_impl(context, name):
    assert context.dragon.name == name


@then('Raise an error with message')
def step_impl(context):
    assert isinstance(context.exc, Exception), 'Not an error'
    assert context.msg is not None, 'Error message is not set'
