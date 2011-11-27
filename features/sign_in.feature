@javascript
Feature: Entering sign in screen
  In order to value
  As a role
  I want feature

  Scenario: Entering sign in page
    Given I am not signed in
    When I go to the home page
    Then I should see the sign in page

  Scenario: Signing in without credentials
    Given I am not signed in
    When I submit an empty sign in form
    Then I see that I should have entered credentials first

  Scenario: Signing in with invalid credentials
    Given I am not signed in
    When I submit the sign in form with invalid credentials
    Then I see that I have entered invalid credentials

  Scenario: Forgot password
