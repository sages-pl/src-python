Feature: Dragon's damage

Scenario: Dragon can make random damage between 5 and 20
    Given Dragon is created with name "Wawelski"
     When Makes damage
     Then Result is between 5 and 20
