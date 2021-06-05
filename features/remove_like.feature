Feature: Remove like

    @javascript
    Scenario: I can remove my like to a article
      Given I logged in and exist a article with my like
      When I push a red heart icon
      Then I shoud see total count like minus one

    @javascript
    Scenario: I can remove my like to a comment
      Given I logged in and exist a article and a comment with a like for article
      When I push a red heart icon in a comment area
      Then I shoud see total count like in comment minus one