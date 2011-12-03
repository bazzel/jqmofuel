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

  # Scenario: Forgot password
  #   Given I have an account with email "john.doe@example.com"
  #   And I am not signed in
  #   When I forgot my password
  #   Then I can ask for an email with instructions about how to reset my password

  Scenario: Asking for reset password instructions without email address
    Given I am not signed in
    When I forgot my password
    And I ask for reset password instructions without providing an email address
    Then I see that I should have entered an email address first

  Scenario: Asking for reset password instructions for invalid email address
    Given I am not signed in
    When I forgot my password
    And I ask for reset password instructions for an invalid email address
    Then I see that I should have entered a valid email address first

