Feature: Entering login screen
  In order to value
  As a role
  I want feature

  Background:
    Given I am using "mobile safari"

  Scenario: Entering sign in page
    Given I am not logged in
    When I go to the home page
    Then I am on the sign in page

  Scenario: Viewing the sign page
    Given I am not logged in
    When I go to the sign in page
    Then I should see "e-fueling" in the header
    Then I should see "Sign In" button in the content
    And I should see "Create Account" in the content

  Scenario: Creating new account
    Given I am not logged in
    When I go to the sign in page
    And I follow "Create Account"
    Then I should see "Create Account" in the header

  Scenario: Email is missing during sign in
  Given I am not logged in
  When I go to the sign in page
  And I press "Sign In"
  Then show me the page



  Scenario: title
    Given I am logged in as a user with email "patrick@domain.com" and password "secret"
    When I go to the home page
