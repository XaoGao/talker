Feature: Create friendship
    @javascript
    Scenario: I can add user to my friend
      Given I logged in and exit another user
      When I push button add fiiend
      Then I shou see the user in subscription