@javascript
Feature: Entering sign in screen
  In order to value
  As a role
  I want feature

  Scenario: Entering sign in page
    Given I am not signed in
    When I go to the home page
    Then I should see the sign in page

  Scenario: Submitting an empty form
    Given I am not signed in
    When I submit an empty sign in form
    Then I see that I should have entered credentials first

  Scenario: Entering invalid credentials
    Given I am not signed in
    When I submit the sign in form with invalid credentials
    Then I see that I have entered invalid credentials

  Scenario: Creating new account
    Given I am not signed in
    When I choose to create a new account
    And I enter valid data for a new account
    # When I go to the sign in page
    # And I follow "Create Account"
    # Then I should see "Create Account" in the header
    # And I fill in "user[email]" with "john@example.com"
    # And I fill in "user[password]" with "secret"
    # And I fill in "user[password_confirmation]" with "secret"
    # And I press "Sign Up"
    Then I should see a page for entering a new car

  Scenario: Creating invalid account

  Scenario: Forgot password
