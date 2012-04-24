Feature: Participants
  In order to efficiently work together
  As a team
  I want to be able to join & assign projects

  Background: Project
    Given I have a project
    And I have a user

  Scenario: Assign user to a project
    When I assign the user to the project
    Then the user should be assigned to the project

  Scenario: Assign the same user twice to a project
    Given the user is assigned to the project
    When I assign the user to the project
    Then the user should be only once in the project users list

  Scenario: Remove a user from a project
    Given the user is assigned to the project
    When I remove the user from the project
    Then the user should no longer be assigned to the project
