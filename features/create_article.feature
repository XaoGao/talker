Feature: Create a new article

    Scenario: I can create a new article an see in a wall
      Given I logged in and click input Create article
      When I write a body input and submit form
      Then I should see a new article in a news wall
