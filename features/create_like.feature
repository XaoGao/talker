Feature: Create like
    @javascript
    Scenario: I can create a like to a article
      Given I logged in and exist a article
      When I push heart icon
      Then I shoud see total count like plus one