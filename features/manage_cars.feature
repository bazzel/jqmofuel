Feature: Manage cars
  In order to enter my car data
  As an iPhone user
  I want to manage my cars

  Scenario: Listing cars
    Given the following cars exist
      |brand|car_model|
      |brand 1|car_model 1|
      |brand 2|car_model 2|
      |brand 3|car_model 3|
      |brand 4|car_model 4|
    And I am using "mobile safari"
    When I go to the home page
    When I tab on "brand 1"
    Then I should see "brand 1"
    And I should see "car_model 1"
    And I should see "Edit"


  # Scenario: Register new car
  #   Given I am on the new car page
  #   When I fill in "Brand" with "brand 1"
  #   And I fill in "Car model" with "car_model 1"
  #   And I press "Create"
  #   Then I should see "brand 1"
  #   And I should see "car_model 1"
  #
  # # Rails generates Delete links that use Javascript to pop up a confirmation
  # # dialog and then do a HTTP POST request (emulated DELETE request).
  # #
  # # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # # dialogs.
  # #
  # # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # # detect the presence of Javascript behind Delete links and issue a DELETE request
  # # instead of a GET request.
  # #
  # # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # # will also turn off the emulation. (See the Capybara documentation for
  # # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # # will also turn off transactions and clean the database with DatabaseCleaner
  # # after the scenario has finished. This is to prevent data from leaking into
  # # the next scenario.
  # #
  # # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # # of the tags above is to modify your views to use <button> instead. You can
  # # see how in http://github.com/jnicklas/capybara/issues#issue/12
  # #
  # Scenario: Delete car
  #   Given the following cars:
  #     |brand|car_model|
  #     |brand 1|car_model 1|
  #     |brand 2|car_model 2|
  #     |brand 3|car_model 3|
  #     |brand 4|car_model 4|
  #   When I delete the 3rd car
  #   Then I should see the following cars:
  #     |Brand|Car model|
  #     |brand 1|car_model 1|
  #     |brand 2|car_model 2|
  #     |brand 4|car_model 4|
