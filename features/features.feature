Feature: Features in projects
  As a participant
  I want to create features and prioritize them

  Background: User & Project
    Given I have a user
    And I have a project

  Scenario: Create a feature within the project
    It starts within in the backlog
    When I create a feature named "User login"
    Then the project should have a feature named "User login"
    And the feature should be in the backlog
