Feature: Change a status

    @javascript
    Scenario: I can change my status
      Given I logged in and visit my page
      When I click on my status and change text
      Then I see a new status
