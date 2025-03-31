from typing import NamedTuple


class Point(NamedTuple):
    x: int = 0
    y: int = 0

    def __str__(self):
        return f'({self.x}, {self.y})'


class Position:
    _position: Point

    def __init__(self, x: int = 0, y: int = 0) -> None:
        self.position_set(x=x, y=y)

    def position_get(self) -> Point:
        return self._position

    def position_set(self, *, x: int, y: int) -> None:
        self._position = Point(x, y)

    def position_change(self, *,
                        left: int = 0, right: int = 0,
                        up: int = 0, down: int = 0
                        ) -> None:
        current_x, current_y = self.position_get()
        new_x = current_x + right - left
        new_y = current_y + down - up
        self.position_set(x=new_x, y=new_y)








def parse(file):
    for line in file:
        if line and not line[0] == '#':
            records = line.split(',')
            return records



def parse(file):
    for line in file:
        if line and not line.startswith('#'):
            records = line.split(',')
            return records



def parse(file):
    for line in file:
        if len(line) != 0 and not line.startswith('#'):
            records = line.split(',')
            return records



def parse(file):
    for line in file:
        if len(line) == 0 or line.startswith('#'):
            continue
        records = line.split(',')
        return records




















def parse(file):
    for line in file:
        if len(line) == 0:
            continue
        if line.startswith('#'):
            continue
        records = line.split(',')
        return records




def parse(file):
    for line in file:
        if line and not (line[0] == '#' or line[1] == '#'):
            records = line.split(',')
            return records


def valid(line):
    """
    ...
    """
    return line and not (line[0] == '#' or line[1] == '#')

def parse(file):
    for line in file:
        if valid(line):
            records = line.split(',')
            return records


# Complexities
# computational - how many steps is in your algorithm, avoid nested loops
# memory - how much memory is used, avoid large data structures
# cyclomatic - how many paths are in your code, avoid too many branches (ifs, match-case)
# cognitive - how hard is it to understand your code, avoid complicated logic (not, and, or, xor, lshift, rshift, exotic operators: @=, %=, >>=, <<=, etc)


# project-myapp
# - alice
# - bob
#
#
#
# jenkins-users
# jenkins-admis
#
# gitea-users
# gitea-admis
#
# sonarqube-users
# sonarqube-admins
#
#
#
#
#
# alice:
# - project-myapp (Sonarqube, Jenkins, Jira, Confluence, ...)
# - jenkins-users
# - gitea-users
# - sonarqube-users
# - sonarqube-admins
#
# sonarqube-admins:
# - alice
# - mallory
