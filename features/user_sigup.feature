Feature: User signup

    Scenario: I can create a new account
      Given I am on signup page
      When I signup a new account
      Then I see a welcome message for new user