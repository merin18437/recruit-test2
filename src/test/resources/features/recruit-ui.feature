@recruit-tests
  Feature: Recruit application tests

    Background: Test environment
      Given I open url "http://3.80.230.80"

    @smoke
    @regression
    @login-success
    Scenario: Successfull login
      When I click on element with xpath "//*[contains(text(), 'Login')]"
      And element with xpath "//*[contains(@class, 'navbar-brand')]" should contain text "Login"
      Then I type "student@example.com" into element with xpath "//input[@placeholder='Please enter an Email']"
      And I type "welcome" into element with xpath "//input[@placeholder='Please enter a Password']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//span[contains(@class, 'logout-box')]/a" to be present
      Then element with xpath "//span[contains(@class, 'logout-box')]/a" should contain text "Student"

    @smoke
    @regression
    @login-wrong-credentials
    Scenario: Wrong credentials
      When I click on element with xpath "//*[contains(text(), 'Login')]"
      And element with xpath "//*[contains(@class, 'navbar-brand')]" should contain text "Login"
      Then I type "student@example.com" into element with xpath "//input[@placeholder='Please enter an Email']"
      And I type "!welcome" into element with xpath "//input[@placeholder='Please enter a Password']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//div[contains(@class, 'alert-danger')]" to be present
      Then element with xpath "//div[contains(@class, 'alert-danger')]" should contain text "Please provide valid credentials"

    @regression
    @candidate-register
    Scenario: Candidate registration
      When I click on element with xpath "//button[contains(text(), 'Apply')]"
      And I type "Artem" into element with xpath "//input[@placeholder='Enter First Name']"
      And I type "Oganesyan" into element with xpath "//input[@placeholder='Enter Last Name']"
      And I type "artem.oganesyan@gmail.com" into element with xpath "//input[@placeholder='Enter Email']"
      And I type "12345Abc" into element with xpath "//input[@placeholder='Enter Password']"
      And I type "12345Abc" into element with xpath "//input[@placeholder='Confirm Password']"
      And I type "Best candidate for any position ever" into element with xpath "//textarea[@placeholder='Enter detailed Summary']"
      And I type "100 Test st" into element with xpath "//input[@placeholder='123 Main st']"
      And I type "My city" into element with xpath "//input[@placeholder='City']"
      And I click on element with xpath "//label[@for='candidateState']/following::select"
      And I click on element with xpath "//option[@value='CA']"
      And I type "10100" into element with xpath "//input[@placeholder='Zip code. Zip plus']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//span[contains(@class, 'logout-box')]/a" to be present
      Then element with xpath "//span[contains(@class, 'logout-box')]/a" should contain text "Oganesyan"