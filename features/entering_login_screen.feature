@javascript
Feature: Entering login screen
  In order to value
  As a role
  I want feature

  Scenario: Entering sign in page
    Given I am not logged in
    When I go to the home page
    Then I should see the sign in page

  Scenario: Creating new account
    Given I am not logged in
    When I go to the sign in page
    And I follow "Create Account"
    Then I should see "Create Account" in the header
    And I fill in "user[email]" with "john@example.com"
    And I fill in "user[password]" with "secret"
    And I fill in "user[password_confirmation]" with "secret"
    And I press "Sign Up"

  Scenario: Submitting an empty form
    Given I am not logged in
    When I submit an empty login form
    Then I see that I should have entered credentials first
