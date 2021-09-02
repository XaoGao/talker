Feature: Show a create article form

    Scenario: I see a form to create a new article
      Given I am logged in
      When I click button new article
      Then I should see a form for new article