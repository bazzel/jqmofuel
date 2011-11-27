@javascript
Feature: Creating an account
  In order to value
  As a role
  I want feature

  Scenario: Creating new account
    Given I am not signed in
    When I choose to create a new account
    And I enter valid data for a new account
    Then I should see a page for entering a new car

  Scenario: Creating invalid account
    Given I am not signed in
    When I choose to create a new account
    And I enter no data for a new account
    Then I see that I should have entered credentials first

  Scenario: Creating invalid account
    Given I am not signed in
    When I choose to create a new account
    But I didn't confirm my password
    Then I see that the password I entered doesn't match confirmation
