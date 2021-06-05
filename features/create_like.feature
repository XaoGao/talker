Feature: Create like

    @javascript
    Scenario: I can create a like to a article
      Given I logged in and exist a article
      When I push heart icon
      Then I shoud see total count like plus one

    @javascript
    Scenario: I can create a like to a comment
      Given I logged in and exist a article and a comment for article
      When I push heart icon in a comment area
      Then I shoud see total count like in comment plus one