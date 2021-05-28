Feature: Create acomment
    @javascript
    Scenario: Create a new a comment for article
      Given I logged in a see a article
      When I write a new comment field and submit
      Then I should see the comment
