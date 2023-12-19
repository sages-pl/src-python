Feature: Dragon's position

Scenario: Create Dragon with default position
    Given Dragon does not exist
     When Dragon is created with name "Wawelski"
     Then Dragon exists
      And Position x is 0
      And Position y is 0

Scenario: Create Dragon with initial position
    Given Dragon does not exist
     When Dragon is created with name "Wawelski" and position x=50 y=100
     Then Dragon exists
      And Position x is 50
      And Position y is 100

Scenario: Dragon returns its position
    Given Dragon is created with name "Wawelski"
      And Position x is 1
      And Position y is 2
     When Gets position
     Then Result is exactly "(1, 2)"

Scenario: Dragon can be set at any position
    Given Dragon is created with name "Wawelski"
     When Sets position x=1 y=2
     Then Position x is 1
      And Position y is 2

Scenario: Dragon changes position right
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position right by 1
     Then Position x is 11
      And Position y is 20

Scenario: Dragon changes position left
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position left by 1
     Then Position x is 9
      And Position y is 20

Scenario: Dragon changes position down
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position down by 1
     Then Position x is 10
      And Position y is 21

Scenario: Dragon changes position up
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position up by 1
     Then Position x is 10
      And Position y is 19

Scenario: Dragon changes position horizontal
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position right by 1
      And Changes position left by 2
     Then Position x is 9
      And Position y is 20

Scenario: Dragon changes position vertical
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position down by 1
      And Changes position up by 2
     Then Position x is 10
      And Position y is 19

Scenario: Dragon changes position omnidirectional
    Given Dragon is created with name "Wawelski"
      And Position x is 10
      And Position y is 20
     When Changes position right by 1
      And Changes position left by 2
      And Changes position down by 3
      And Changes position up by 4
     Then Position x is 9
      And Position y is 19
