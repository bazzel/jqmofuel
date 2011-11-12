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

  Scenario: Email is missing during sign in
  Given I am not logged in
  When I go to the sign in page
  And I press "Sign In"

  Scenario: title
    Given I am logged in as a user with email "patrick@domain.com" and password "secret"
    When I go to the home page
