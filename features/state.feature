Feature: State of a feature
  In order to manage a project
  Features should have a state
  And should be changable between states

  Background:
    Given I have a project

  Scenario: Change state
    Given I have a feature named "Dit is een mooie feature"
    When I change the state of a feature
    Then the feature should have a different state

  
