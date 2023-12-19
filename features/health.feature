Feature: Dragon's health

Scenario: Create Dragon has random health points
    Given Dragon does not exist
     When Dragon is created with name "Wawelski"
     Then Dragon exists
      And Health is between 50 and 100

Scenario: Dragon can take damage
    Given Dragon is created with name "Wawelski"
      And Health is 3
     When Takes damage 2
     Then Health is 1

Scenario: Dragon is dead when health is zero
    Given Dragon is created with name "Wawelski"
     When Health is 0
     Then Is dead

Scenario: Dragon is dead when health is negative
    Given Dragon is created with name "Wawelski"
     When Health is -1
     Then Is dead
