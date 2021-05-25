Feature: User signin

    Scenario: Created user can signin
      Given I am on signin page and user exist
      When I write email/password and click submit
      Then I should see welcome message 