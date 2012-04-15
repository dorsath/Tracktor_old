Feature: Participants
  In order to efficiently work together
  As a team
  I want to be able to join & assign projects

  Scenario: Create user
    When I create a new user
    Then I should have a new user

  Scenario: Assign user to a project
    Given I have a project
    And I have a user
    When I assign the user to the project
    Then the user should be assigned to the project
